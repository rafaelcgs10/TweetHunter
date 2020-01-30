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
  validates :hashtag,
            presence: true,
            format: { with: /\A#[a-zA-Z0-9]+( (OR|AND) #[a-zA-Z0-0]+)*\z/,
                      message: 'field is not a valid query' }
end
