class CreatePlanDays < ActiveRecord::Migration
  def change
    create_table :plan_days do |t|
      t.integer :day
      t.integer :plan_id

      t.timestamps
    end
  end
end
