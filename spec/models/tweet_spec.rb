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

require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context 'validation tests' do
    it('should not save the same tweet twice') do
      tweet1 = Tweet.new
      tweet1.tweet_id = '123456'
      tweet1.save
      tweet2 = Tweet.new
      tweet2.tweet_id = '123456'
      expect(tweet2.save).to eq(false)
    end
  end
end
