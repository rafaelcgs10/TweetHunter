# frozen_string_literal: true

# Why? To clean up the data base from old tweets
class DeleteOldTweetsJob
  @queue = :delete

  def self.perform
    tweets = Tweet.where("created_at > ?", 1.days.ago)
    tweets.destroy_all
    tweets.destroy_all
  end
end
