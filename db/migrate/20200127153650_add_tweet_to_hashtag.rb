# frozen_string_literal: true

class AddTweetToHashtag < ActiveRecord::Migration[6.0]
  def change
    add_reference :hashtags, :tweet, null: false, foreign_key: true
  end
end
