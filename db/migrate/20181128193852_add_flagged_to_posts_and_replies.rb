class AddFlaggedToPostsAndReplies < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :flagged, :boolean
    add_column :replies, :flagged, :boolean
  end
end
