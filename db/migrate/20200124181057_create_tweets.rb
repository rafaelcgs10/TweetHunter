class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :name
      t.string :tweet_id
      t.datetime :date
      t.string :hashtag

      t.timestamps
    end
  end
end
