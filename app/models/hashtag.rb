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
require 'treetop'

class Hashtag < ApplicationRecord
  validates_uniqueness_of :hashtag
  validates :hashtag,
            presence: true,
            format: { with: /\A#[a-zA-Z0-9]+( (OR|AND) #[a-zA-Z0-0]+)*\z/,
                      message: 'field is not a valid query' }

  def self.hashtags
    all.map(&:hashtag)
  end

  # ((?=.*\B#dog\b)(?=.*\B#cat\b)|(?=.*\B#bear\b))
  def self.stream_query
    @hashtags = all
    @queries = @hashtags.map do |hashtag|
      hashtag.hashtag.gsub(' AND ', ' ')
    end
    @queries.join(',')
  end

  def self.parser(string)
    Treetop.load 'app/models/grammars/hashtag'
    parser = ExpParser.new
    result = parser.parse(string)
    puts result
    unless result
      puts parser.failure_reason
      puts parser.failure_line
      puts parser.failure_column
    end
    result.value
  end
end
