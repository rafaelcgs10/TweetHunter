# frozen_string_literal: true

require 'resque/tasks'
require 'resque/scheduler/tasks'

task 'resque:setup' => :environment do
  ENV['QUEUE'] = '*'
end
