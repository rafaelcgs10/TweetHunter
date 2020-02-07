# typed: false
# frozen_string_literal: true

require 'treetop'
require 'sorbet-runtime'

class QueryMatchUtil
  extend T::Sig

  sig { params(string: String).returns(T.any(String, T::Boolean)) }
  def self.clean_query(string)
    Treetop.load 'app/utils/grammars/query'
    parser = QueryGrammarParser.new
    parsed = parser.parse(string)
    if parsed
      parsed.get_string
    else
      false
    end
  end

  sig { params(query: String, string: String).returns(T::Boolean) }
  def self.match?(query, string)
    Treetop.load 'app/utils/grammars/query'
    parser = QueryGrammarParser.new
    parsed = parser.parse(query)
    regex = Regexp.new(parsed.get_regex, Regexp::IGNORECASE)
    regex.match?(string)
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
