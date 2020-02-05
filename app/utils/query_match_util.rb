# frozen_string_literal: true

require 'treetop'

class QueryMatchUtil
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

  def self.match?(query, string)
    Treetop.load 'app/utils/grammars/query'
    parser = QueryGrammarParser.new
    parsed = parser.parse(query)
    regex = Regexp.new(parsed.get_regex, Regexp::IGNORECASE)
    regex.match?(string)
  end

  # Why? To generate queries from hashtags to use in the Twitter Stream
  def self.stream_queries
    hashtags = Hashtag.all
    queries = hashtags.map do |hashtag|
      hashtag.hashtag.gsub(' AND ', ' ')
    end
    queries.join(',')
  end
end
