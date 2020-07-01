class AddStockidToNondas < ActiveRecord::Migration[5.2]
  def change
    add_column :nondas, :stockid, :integer
  end
end
