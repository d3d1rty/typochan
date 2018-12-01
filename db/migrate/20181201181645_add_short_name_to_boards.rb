class AddShortNameToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :short_name, :string
  end
end
