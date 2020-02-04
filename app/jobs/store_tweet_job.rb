# frozen_string_literal: true

# Why? To implement Twitter search job
class StoreTweetJob
  @queue = :store

  def self.perform(status, content)
    hashtags = Hashtag.all
    hashtags.each do |hashtag|
      store(hashtag, status, content) 
    end
  end

  def self.store(hashtag, status, content)
    if QueryMatchUtil.match?(hashtag.hashtag, content)
      tweet = Tweet.new(name: status["user"]["screen_name"], tweet_id: status["id"],
                        hashtag: hashtag.hashtag, content: content,
                        date: status["created_at"])
      if tweet.save
        TweetsChannel.broadcast_to(hashtag, content: render_tweet(tweet))
      end
    end
  end

  def self.render_tweet(tweet)
    ApplicationController.renderer.render(
      partial: 'tweets/tweet', locals: { tweet: tweet }
    )
  end
end
