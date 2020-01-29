class Hashtag < ApplicationRecord
  validates_uniqueness_of :hashtag
  validates :hashtag,
            presence: true,
            format: { with: /\A#[a-zA-Z0-9]+( (OR|AND) #[a-zA-Z0-0]+)*\z/,
                      message: 'field is not a valid hashtag query' }
end
