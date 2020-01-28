# frozen_string_literal: true

require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  test 'should have hastag' do
    hashtag = Hashtag.new
    assert !hashtag.save, 'saved without setting the hashtag'
  end
end
