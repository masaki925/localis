class AddReferenceOfRequestToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :request_id, :integer
  end
end
