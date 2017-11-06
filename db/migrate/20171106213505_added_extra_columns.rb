class AddedExtraColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :movies_checked_out_count, :integer
    add_column :movies, :available_inventory, :integer
  end
end
