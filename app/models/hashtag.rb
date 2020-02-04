# frozen_string_literal: true

# == Schema Information
#
# Table name: hashtags
#
#  id         :bigint           not null, primary key
#  hashtag    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hashtag < ApplicationRecord
  validates_uniqueness_of :hashtag
  validates :hashtag, :presence => true
  validate :valid_query

  def valid_query
    unless QueryMatchUtil.valid? hashtag
      errors.add(:hashtag, 'is not a well constructed query')
    end
  end

  def self.hashtags
    all.map(&:hashtag)
  end
end
