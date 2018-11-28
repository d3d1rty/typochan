class AddModToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mod, :boolean
  end
end
