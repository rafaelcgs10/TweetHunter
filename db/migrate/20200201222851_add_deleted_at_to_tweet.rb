# typed: true
# frozen_string_literal: true

class AddDeletedAtToTweet < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :deleted_at, :datetime
    add_index :tweets, :deleted_at
  end
end
