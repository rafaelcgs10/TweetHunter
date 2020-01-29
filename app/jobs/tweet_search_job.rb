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
    hashtag.gsub(' AND ', ' ')
    CLIENT.search(hashtag, tweet_mode: 'extended').take(number).each do |status|
      content = if status.retweet?
                  status.retweeted_status.attrs[:full_text]
                elsif status.truncated? && status.attrs[:extended_tweet]
                  status.attrs[:extended_tweet][:full_text]
                else
                  status.attrs[:text] || status.attrs[:full_text]
                end
      Tweet.create(name: status.user.screen_name, tweet_id: status.id,
                   hashtag: hashtag, content: content, date: status.created_at)
    end
  end
end
