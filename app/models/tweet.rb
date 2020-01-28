# frozen_string_literal: true

class Tweet < ApplicationRecord
  validates_uniqueness_of :tweet_id
end
