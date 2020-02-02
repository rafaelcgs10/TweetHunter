# frozen_string_literal: true

# Why? To clean up the data base from old tweets
class DeleteOldTweetsJob
  @queue = :delete

  def self.perform
    @tweets = Tweet.where("created_at > ?", 1.days.ago)
    @tweets.delete_all!
    @tweets.delete_all!
    @deleted = Tweet.only_deleted
    @deleted.delete_all!
    @deleted.delete_all!
  end
end
