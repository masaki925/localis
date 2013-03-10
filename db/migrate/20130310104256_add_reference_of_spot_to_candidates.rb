class AddReferenceOfSpotToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :spot_id, :integer
  end
end
