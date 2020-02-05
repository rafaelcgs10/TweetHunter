# frozen_string_literal: true

class TweetsChannel < ApplicationCable::Channel
  def subscribed
    @hashtag = Hashtag.find(params[:id])
    stream_for @hashtag
  end

  def unsubscribed; end
end
