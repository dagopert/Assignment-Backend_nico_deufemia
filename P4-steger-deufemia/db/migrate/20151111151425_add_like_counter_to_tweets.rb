class AddLikeCounterToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :like_counter, :integer, default: 0
  end
end
