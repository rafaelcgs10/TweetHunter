# frozen_string_literal: true

# Why? To implement Twitter search job
class TweetStreamJob
  @queue = :twitter

  def self.perform
    stream_hashtags
  end

  def self.stream_hashtags
    @query = QueryMatchUtil.stream_queries
    STREAM.filter(track: @query, tweet_mode: 'extended') do |status|
      puts '_--------------------_'
      content = Tweet.get_full_content(status)
      puts content
      hashtags = Hashtag.hashtags
      hashtags.select! do |hashtag|
        QueryMatchUtil.match?(hashtag, content)
      end
      puts "hashtags: #{hashtags}"
      puts '____________________'
      @query = QueryMatchUtil.stream_queries
    end
  end
end
