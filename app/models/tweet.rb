# frozen_string_literal: true

# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  name       :string
#  tweet_id   :string
#  date       :datetime
#  hashtag    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  content    :text
#

class Tweet < ApplicationRecord
  before_create :limit_table
  acts_as_paranoid
  validates_uniqueness_of :tweet_id, scope: :hashtag
  
  def self.get_full_content(status)
    content = if status.retweet?
                 untrucate(status.retweeted_status)
               else
                 untrucate(status)
               end
    content
  end

  def self.untrucate(status)
    if status.truncated? && status.attrs[:extended_tweet]
      status.attrs[:extended_tweet][:full_text]
    else
      status.attrs[:full_text] || status.attrs[:text]
    end
  end

  private

  def limit_table
    if Tweet.count >= 6000
      Tweet.first.destroy_fully!
    end
  end
end
