# frozen_string_literal: true

class CreateHashtags < ActiveRecord::Migration[6.0]
  def change
    create_table :hashtags do |t|
      t.string :hashtag

      t.timestamps
    end
  end
end
