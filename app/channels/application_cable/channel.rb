# typed: false
# frozen_string_literal: true

module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def connect
      self.current_hashtag = Hashtag.find(params[:id])
    end
  end
end
