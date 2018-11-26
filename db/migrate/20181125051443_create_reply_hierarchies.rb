class CreateReplyHierarchies < ActiveRecord::Migration[5.2]
  def change
    create_table :reply_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :reply_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "reply_anc_desc_idx"

    add_index :reply_hierarchies, [:descendant_id],
      name: "reply_desc_idx"
  end
end
