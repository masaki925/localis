class AddReferenceToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :plan_id, :integer
  end
  def down
    delete_column :spots, :plan_id
  end
end
