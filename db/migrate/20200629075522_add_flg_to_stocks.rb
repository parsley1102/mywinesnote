class AddFlgToStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :stocks, :del_flg, :boolean
  end
end
