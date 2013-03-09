class CreateSpotTours < ActiveRecord::Migration
  def change
    create_table :spot_tours do |t|
      t.integer :spot_id
      t.integer :tour_id

      t.timestamps
    end
    add_index :spot_tours, :spot_id
    add_index :spot_tours, :tour_id
  end
end
