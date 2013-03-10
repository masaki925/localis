class AddReferenceOfCandidateToSpots < ActiveRecord::Migration
  def change
    add_column :spots, :candidate_id, :integer
  end
end
