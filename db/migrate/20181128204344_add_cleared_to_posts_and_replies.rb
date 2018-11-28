class AddClearedToPostsAndReplies < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :cleared, :boolean
    add_column :replies, :cleared, :boolean
  end
end
