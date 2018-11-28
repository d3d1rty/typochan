class AddPriorityToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :priority, :integer
    add_index :boards, :priority
  end
end
