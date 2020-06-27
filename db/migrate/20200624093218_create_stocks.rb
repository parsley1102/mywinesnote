class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :wine_name
      t.string :producer
      t.string :country
      t.string :region
      t.text :general_notes
      t.integer :vintage
      t.integer :price
      t.integer :amount
      t.string :bought_from
      t.date :bought_on
      t.integer :cellar_id
      t.text :stock_notes
      t.integer :status

      t.timestamps
    end
  end
end
