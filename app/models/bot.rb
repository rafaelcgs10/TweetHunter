# frozen_string_literal: true

# Why? To implement Twitter search methods to be used by a job
class Bot < ApplicationRecord
  def self.search_words(words)
    CLIENT.search(words, lang: 'en').first
  end

  def self.search_hashtag(hashtag)
    chr = 'a,b,c'
    chr.split(',')
    CLIENT.search(hashtag).take(10).each do |t|
      Tweet.create(name: t.user.screen_name,
                   tweet_id: t.id.to_s, hashtag: hashtag, content: t.text,
                   date: t.created_at)

      logger.info('Found tweet')
    end
  end
end
