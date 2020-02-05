# typed: false
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

require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  context 'validation tests' do
    it 'should not save without setting the hashtag' do
      hashtag = Hashtag.new
      expect(hashtag.save).to eq(false)
    end
    it 'should reject abc as a hastag' do
      hashtag = Hashtag.new
      hashtag.hashtag = 'abc'
      expect(hashtag.valid?).to eq(false)
    end
    it 'should accept #pokemon as a hashtag' do
      hashtag = Hashtag.new
      hashtag.hashtag = '#pokemon'
      expect(hashtag.valid?).to eq(true)
    end
    it 'should not save the same hashtag twice' do
      hashtag1 = Hashtag.new
      hashtag1.hashtag = '#pokemon'
      hashtag1.save
      hashtag2 = Hashtag.new
      hashtag2.hashtag = '#pokemon'
      expect(hashtag2.save).to eq(false)
    end
  end
end
