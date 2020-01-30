require 'rails_helper'

RSpec.describe TweetSearchJob, type: :job do
  context 'run the tweet search job' do
    fixtures :hashtags

    scenario 'should perform' do
      VCR.use_cassette("synopsis") do
        TweetSearchJob.perform(1)
      end
      tweet = Tweet.find_by(tweet_id: '1223020111071711235')
      expect(tweet.content).to include('Despite how sad he is he must d his physiotherapy')
    end

    scenario 'should perform too' do
      VCR.use_cassette("synopsis3") do
        TweetSearchJob.perform(1)
      end
      tweet = Tweet.find_by(tweet_id: '1223020579726352390')
      expect(tweet.name).to eq('line_sidore')
    end
  end
end
