class AddColumnToReplies < ActiveRecord::Migration[5.2]
  def change
    add_column :replies, :parent_id, :integer
  end
end
