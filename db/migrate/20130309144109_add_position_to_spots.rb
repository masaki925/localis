class AddPositionToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :position, :integer
  end
end
