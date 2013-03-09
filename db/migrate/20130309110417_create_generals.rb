class CreateGenerals < ActiveRecord::Migration
  def change
    create_table :generals do |t|
      t.string :title, limit:45
      t.string :country_code, limit:2
      t.text :visa
      t.text :climate
      t.text :payment
      t.text :annual_events
      t.text :transportation
      t.text :price

      t.timestamps
    end
  end
end
