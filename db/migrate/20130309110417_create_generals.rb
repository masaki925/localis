class CreateGenerals < ActiveRecord::Migration
  def change
    create_table :generals do |t|
      t.string :title, limit:45
      t.string :country_code, limit:2
      t.text :general
      t.text :bizhour
      t.text :money
      t.text :safety
      t.text :emergency
      t.text :useful
      t.text :annual_events
      t.text :transportation
      t.text :prices

      t.timestamps
    end
  end
end
