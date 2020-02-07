# typed: false
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
  validates_uniqueness_of :hashtag, if: :validate_query
  validates :hashtag, presence: true
  before_save :validate_query
  validate :validate_query

  def self.hashtags
    all.map(&:hashtag)
  end

  def validate_query
    cleaned = QueryMatchUtil.clean_query hashtag
    if cleaned
      self.hashtag = cleaned
    else
      errors.add(:hashtag, 'is not a well constructed query')
      false
    end
  end
end
