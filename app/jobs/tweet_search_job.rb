# frozen_string_literal: true

# Why? To implement Twitter search job
class TweetSearchJob
  @queue = :twitter

  def self.perform
    search_hashtag('#UNITYDAYS2020')
    puts 'Hunting tweets'
  end

  def self.search_hashtag(hashtag)
    CLIENT.search(hashtag).take(10).each do |t|
      Tweet.create(name: t.user.screen_name,
                   tweet_id: t.id.to_s, hashtag: hashtag, content: t.text,
                   date: t.created_at)
    end
  end
end
