class AddFlgToWishes < ActiveRecord::Migration[5.2]
  def change
    add_column :wishes, :del_flg, :boolean
  end
end
