class CreateCandidateSpots < ActiveRecord::Migration
  def change
    create_table :candidate_spots do |t|
      t.references :candidate
      t.references :spot
      t.text :recommend
      t.text :comment

      t.timestamps
    end
    add_index :candidate_spots, :candidate_id
    add_index :candidate_spots, :spot_id
  end
end
