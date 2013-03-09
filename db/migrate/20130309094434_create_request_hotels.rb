class CreateRequestHotels < ActiveRecord::Migration
  def change
    create_table :request_hotels do |t|
      t.integer :request_id
      t.integer :spot_id
      t.datetime :start_datetime
      t.datetime :end_datetime

      t.timestamps
    end
    add_index :request_hotels, :request_id
    add_index :request_hotels, :spot_id
  end
end
