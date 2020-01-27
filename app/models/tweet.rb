class Tweet < ApplicationRecord
  validates_uniqueness_of :tweet_id
  validates :tweet_id, presence: true
end
