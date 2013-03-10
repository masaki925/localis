class AddPositionToPlanSpots < ActiveRecord::Migration
  def change
    add_column :plan_spots, :position, :integer
  end
end
