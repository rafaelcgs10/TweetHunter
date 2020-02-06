# typed: true
# frozen_string_literal: true

# Why? To clean up the data base from old tweets
class DeleteTweetsJob
  @queue = :delete

  def self.perform(hashtag)
    puts 'hard deleting'
    tweets = Tweet.where(hashtag: hashtag)
    tweets.delete_all!
  end
end
