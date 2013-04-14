class AddLatlngToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :lat, :string
    add_column :spots, :lng, :string
  end
end
