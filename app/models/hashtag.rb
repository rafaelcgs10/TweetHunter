class Hashtag < ApplicationRecord
  validates_uniqueness_of :hashtag
  validates :hashtag,
            presence: true,
            format: { with: /\A#[a-zA-Z0-9]+\z/,
                      message: 'field is invalid: not a hashtag.' }
end
