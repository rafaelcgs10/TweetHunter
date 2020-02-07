# typed: false
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QueryMatchUtil do
  context 'clean_query function' do
    it('should fail because is not hashtag') do
      expect(QueryMatchUtil.clean_query('nop')).to eq(false)
    end

    it('should fail because is empty') do
      expect(QueryMatchUtil.clean_query('')).to eq(false)
    end

    it('should fail because is nil') do
      expect { QueryMatchUtil.clean_query(nil) }.to raise_error(TypeError)
    end

    it('should be successful because is a hashtag') do
      result = QueryMatchUtil.clean_query ' #car  AND   (#boat OR  #airplane ) '
      expect(result).to eq('#car AND (#boat OR #airplane)')
    end
  end

  context 'match? function' do
    it('should be successful because #car matches') do
      result = QueryMatchUtil.match?('#car', '#car is fast')
      expect(result).to eq(true)
    end

    it('should be successful because #cat AND #dog matches') do
      result = QueryMatchUtil.match?('#cat AND #dog',
                                     '#dog is better than #cat')
      expect(result).to eq(true)
    end

    it("should fail because #cat AND #dog doesn't matches") do
      result = QueryMatchUtil.match?('#cat AND #dog',
                                     '#dog is better than #frog')
      expect(result).to eq(false)
    end

    it('should be successful because #cat OR (#dog AND #frog) matches') do
      result = QueryMatchUtil.match?('#cat OR (#dog AND #frog)',
                                     '#dog is better than #frog')
      expect(result).to eq(true)
    end
  end

  context 'stream_queries function' do
    fixtures :hashtags
    it('should be successful') do
      result = QueryMatchUtil.stream_queries
      expect(result).to eq('#dog,#cat')
    end
  end
end
