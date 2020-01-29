require 'test_helper'

class HashtagTest < ActiveSupport::TestCase
  test 'should not save without setting the hashtag' do
    hashtag = Hashtag.new
    assert !hashtag.save, 'saved without setting the hashtag'
  end

  test 'should reject abc as a hastag' do
    hashtag = Hashtag.new
    hashtag.hashtag = 'abc'
    assert !hashtag.valid?, 'abc is not a valid hashtag'
  end

  test 'should accept #pokemon as a hashtag' do
    hashtag = Hashtag.new
    hashtag.hashtag = '#pokemon'
    assert hashtag.valid?, '#pokemon is a valid hashtag'
  end

  test 'should not save the same hashtag twice' do
    hashtag1 = Hashtag.new
    hashtag1.hashtag = '#pokemon'
    hashtag1.save
    hashtag2 = Hashtag.new
    hashtag2.hashtag = '#pokemon'
    assert !hashtag2.save, 'saved the same hashtag a second time'
  end
end
