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
  validates_uniqueness_of :tweet_id
  acts_as_paranoid
end
