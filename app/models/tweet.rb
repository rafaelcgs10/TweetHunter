# frozen_string_literal: true

class Tweet < ApplicationRecord
  belogs_to :hashtags
  validates_uniqueness_of :tweet_id
  validates :tweet_id, presence: true
end
