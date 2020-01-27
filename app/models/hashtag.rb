class Hashtag < ApplicationRecord
  has_many :tweets
  validates_uniqueness_of :hashtag
end
