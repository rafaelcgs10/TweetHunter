class TweetsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    hashtag = Hashtag.find(params[:id])
    stream_for hashtag
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
