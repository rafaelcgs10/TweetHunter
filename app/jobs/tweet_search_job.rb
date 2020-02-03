# frozen_string_literal: true

# Why? To implement Twitter search job
class TweetSearchJob
  @queue = :twitter

  def self.perform(number)
    @hashtags = Hashtag.all

    @hashtags.each do |tag|
      search_hashtag(tag, number)
    end
  end

  def self.search_hashtag(hashtag, number)
    query = hashtag.hashtag.gsub(' AND ', ' ')
    CLIENT.search(query, tweet_mode: 'extended').take(number).each do |status|
      puts "hunting: #{query}"
      content = Tweet.get_full_content(status)
      @tweet = Tweet.create(name: status.user.screen_name, tweet_id: status.id,
                            hashtag: hashtag.hashtag, content: content, date: status.created_at)
      @res = TweetsChannel.broadcast_to(hashtag, content: content)
      puts "res: #{@res}"
    end
  end
end
