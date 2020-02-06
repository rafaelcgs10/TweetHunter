# typed: true
# frozen_string_literal: true

# Why? To clean up the data base from old tweets
class DeleteTweetsJob
  extend T::Sig
  @queue = :delete

  sig { params(hashtag: String).returns(Integer) }
  def self.perform(hashtag)
    tweets = Tweet.where(hashtag: hashtag)
    tweets.delete_all!
  end
end
