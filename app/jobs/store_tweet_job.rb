# frozen_string_literal: true

# Why? To implement Twitter search job
class StoreTweetJob
  @queue = :store

  def self.perform(hashtag, status)
    store(hashtag, status)
  end

  def self.store(hashtag, status)
    content = Tweet.get_full_content(status)
    tweet = Tweet.new(name: status.user.screen_name, tweet_id: status.id,
                      hashtag: hashtag, content: content,
                      date: status.created_at)
    TweetsChannel.broadcast_to(hashtag, content: render_tweet(tweet)) if tweet.save
    puts "sending: #{content}"
  end

  def self.render_tweet(tweet)
    ApplicationController.renderer.render(
      partial: 'tweets/tweet', locals: { tweet: tweet }
    )
  end
end
