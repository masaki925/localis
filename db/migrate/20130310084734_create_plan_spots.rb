class CreatePlanSpots < ActiveRecord::Migration
  def change
    create_table :plan_spots do |t|
      t.references :plan_day
      t.references :spot

      t.timestamps
    end
    add_index :plan_spots, :plan_day_id
    add_index :plan_spots, :spot_id
  end
end
