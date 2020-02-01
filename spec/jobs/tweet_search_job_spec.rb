# coding: utf-8
require 'rails_helper'

RSpec.describe TweetSearchJob, type: :job do
  context 'run the tweet search job' do

    scenario 'should perform' do
      VCR.use_cassette("synopsis") do
        TweetSearchJob.perform(1)
      end
      tweet = Tweet.find_by(tweet_id: '1223409824643395586')
      expect(tweet.content).to eq('Woo it’s #FridayNight! Happy #FridayFunDay everybody! I’m ready to do something. I wanna go out and have some fun! Poppy better not ruin this for me... #dog #dogs #dogsoftwitter #dogsofinstagram #pug #pugs @TheEllenShow @jimmyfallon #lulunatics #doglover # https://t.co/wnt58BzjuR')
    end

    scenario 'should perform too' do
      VCR.use_cassette("synopsis") do
        TweetSearchJob.perform(1)
      end
      tweet = Tweet.find_by(tweet_id: '1223409921733144576')
      expect(tweet.name).to eq('MariaCa27479197')
    end
  end
end
