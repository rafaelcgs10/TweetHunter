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
  validates :hashtag,
            presence: true,
            format: { with: /\A#[a-zA-Z0-9]+( (OR|AND) #[a-zA-Z0-0]+)*\z/,
                      message: 'field is not a valid query' }

  def self.hashtags
    all.map(&:hashtag)
  end

  # def self.stream_query
  #   @hashtags = all
  #   @queries = @hashtags.map do |hashtag|
  #     hashtag.hashtag.gsub(' AND ', ' ')
  #   end
  #   @queries.join(',')
  # end
end
