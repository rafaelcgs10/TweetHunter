# typed: true
# frozen_string_literal: true

# Why? To implement Twitter search job
class StoreTweetJob
  extend T::Sig
  @queue = :store

  sig { params(status: Hash, content: String).void }
  def self.perform(status, content)
    hashtags = Hashtag.all
    hashtags.each do |hashtag|
      store(hashtag, status, content)
    end
  end

  sig { params(hashtag: Hashtag, status: Hash, content: String).void }
  def self.store(hashtag, status, content)
    return unless QueryMatchUtil.match?(hashtag.hashtag, content)

    tweet = Tweet.new(name: status['user']['screen_name'],
                      tweet_id: status['id'], hashtag: hashtag.hashtag,
                      content: content, date: status['created_at'])
    return unless tweet.save

    TweetsChannel.broadcast_to(hashtag, content: render_tweet(tweet))
  end

  def self.render_tweet(tweet)
    ApplicationController.renderer.render(
      partial: 'tweets/tweet', locals: { tweet: tweet }
    )
  end
end
