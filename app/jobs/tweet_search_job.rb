# frozen_string_literal: true

# Why? To implement Twitter search job
class TweetSearchJob
  @queue = :twitter

  def self.perform
    @hashtags = Hashtag.all

    @hashtags.each do |tag|
      search_hashtag(tag.hashtag, 10)
    end
  end

  def self.search_hashtag(hashtag, number)
    puts "Hunting hashtag #{hashtag}"
    CLIENT.search(hashtag).take(number).each do |t|
      Tweet.create(name: t.user.screen_name,
                   tweet_id: t.id.to_s, hashtag: hashtag, content: t.text,
                   date: t.created_at)
    end
  end
end
