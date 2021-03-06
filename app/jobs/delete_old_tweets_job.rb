# typed: true
# frozen_string_literal: true

# Why? To clean up the data base from old tweets
class DeleteOldTweetsJob
  @queue = :delete

  def self.perform
    @tweets = Tweet.where('created_at < ?', 6.hours.ago)
    @tweets.delete_all!
    @tweets.delete_all!
    @deleted = Tweet.only_deleted
    @deleted.delete_all!
    @deleted.delete_all!
  end
end
