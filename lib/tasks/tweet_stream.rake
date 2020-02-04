# frozen_string_literal: true

namespace :tweet_stream do
  task start: :environment do
    stream_hashtags
  end

  def stream_hashtags
    @query = QueryMatchUtil.stream_queries
    STREAM.filter(track: @query, tweet_mode: 'extended') do |status|
      content = Tweet.get_full_content(status)
      Resque.enqueue(StoreTweetJob, status, content)
      @query = QueryMatchUtil.stream_queries
    end
  end

end
