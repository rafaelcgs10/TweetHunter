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
      hashtags = Hashtag.all
      hashtags.each do |hashtag|
        next unless QueryMatchUtil.match?(hashtag.hashtag, content)

        tweet = Tweet.new(name: status.user.screen_name, tweet_id: status.id,
                          hashtag: hashtag.hashtag, content: content,
                          date: status.created_at)
        next unless tweet.save

        TweetsChannel.broadcast_to(hashtag, content: render_tweet(tweet))
        puts "sending: #{content} to the tweets_channel_#{hashtag.hashtag}"
      end
      puts "hashtags: #{hashtags}"
      puts '____________________'
      @query = QueryMatchUtil.stream_queries
    end
  end

  def self.render_tweet(tweet)
    ApplicationController.renderer.render(
      partial: 'tweets/tweet', locals: { tweet: tweet }
    )
  end
end
