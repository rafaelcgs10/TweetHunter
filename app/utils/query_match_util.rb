# typed: false
# frozen_string_literal: true

require 'treetop'
require 'sorbet-runtime'

class QueryMatchUtil
  extend T::Sig

  sig { params(string: String).returns(T::Boolean) }
  def self.valid?(string)
    Treetop.load 'app/utils/grammars/query'
    if !string.nil? && !string.empty?
      parser = QueryGrammarParser.new
      result = parser.parse(string)
      !result.nil?
    else
      false
    end
  end

    # Why? To generate queries from hashtags to use in the Twitter Stream
  sig { returns(String) }
  def self.stream_queries
    hashtags = Hashtag.all
    queries = hashtags.map do |hashtag|
      hashtag.hashtag.gsub(' AND ', ' ')
    end
    queries.join(',')
  end
end
