class AddPriorityToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :priority, :integer
    add_index :pages, :priority
  end
end
