class CreateWishes < ActiveRecord::Migration[5.2]
  def change
    create_table :wishes do |t|
      t.string :wine_name
      t.string :producer
      t.string :country
      t.string :region
      t.text :general_notes
      t.integer :min_price
      t.integer :max_price
      t.text :wishes_note

      t.timestamps
    end
  end
end
