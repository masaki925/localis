class CreatePlanSpots < ActiveRecord::Migration
  def change
    create_table :plan_spots do |t|
      t.integer :plan_day_id
      t.integer :spot_id
      t.text :comment
      t.integer :timetogo
      t.integer :position

      t.timestamps
    end
    add_index :plan_spots, :plan_day_id
    add_index :plan_spots, :spot_id
  end
end
