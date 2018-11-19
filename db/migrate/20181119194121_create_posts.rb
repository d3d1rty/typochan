class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :poster
      t.string :subject
      t.text :body
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
