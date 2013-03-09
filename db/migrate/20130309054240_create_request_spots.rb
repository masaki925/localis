class CreateRequestSpots < ActiveRecord::Migration
  def change
    create_table :request_spots do |t|
      t.integer :request_id, null:false
      t.integer :spot_id, null:false

      t.timestamps
    end
    add_index :request_spots, :spot_id
    add_index :request_spots, :request_id
  end
end
