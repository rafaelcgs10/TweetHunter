# typed: true
# frozen_string_literal: true

class RemoveTweetFromHashtag < ActiveRecord::Migration[6.0]
  def change
    remove_reference :hashtags, :tweet, null: false, foreign_key: true
  end
end
