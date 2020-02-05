# frozen_string_literal: true

require 'resque/scheduler'

Resque.redis = 'localhost:6379'
Resque.redis.namespace = "resque:Scheduler"

if Rails.env.development? || Rails.env.test?
  Resque.redis = Redis.new(host: 'localhost', port: '6379')
else
  uri = URI.parse(ENV['REDISTOGO_URL'])
  REDIS = Redis.new(host: uri.host, port: uri.port, password: uri.password)

  Resque.redis = REDIS
end

# If you want to be able to dynamically change the schedule,
# uncomment this line.  A dynamic schedule can be updated via the
# Resque::Scheduler.set_schedule (and remove_schedule) methods.
# When dynamic is set to true, the scheduler process looks for
# schedule changes and applies them on the fly.
# Note: This feature is only available in >=2.0.0.
# Resque::Scheduler.dynamic = true

Dir["#{Rails.root}/app/jobs/*.rb"].sort.each { |file| require file }

# The schedule doesn't need to be stored in a YAML, it just needs to
# be a hash.  YAML is usually the easiest.
Resque.schedule = YAML.load_file(Rails.root.join('config', 'resque_schedule.yml'))
