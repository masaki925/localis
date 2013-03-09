class CreatePlanDays < ActiveRecord::Migration
  def change
    create_table :plan_days do |t|
      t.integer :plan_id
      t.integer :day

      t.timestamps
    end
    add_index :plan_days, :plan_id
  end
end
