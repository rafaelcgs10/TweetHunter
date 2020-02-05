# typed: true
# frozen_string_literal: true

class AddFieldsToTweets < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :content, :text
  end
end
