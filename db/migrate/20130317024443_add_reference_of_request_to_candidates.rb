class AddReferenceOfRequestToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :request_id, :integer
  end
end
