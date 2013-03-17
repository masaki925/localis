class CreateSpotCandidates < ActiveRecord::Migration
  def change
    create_table :spot_candidates do |t|
      t.integer :request_id
      t.integer :spot_id
      t.integer :user_id
      t.text :recommendation_text, limit:400
      t.text :comments, limit:400
      t.timestamps
    end
    add_index :spot_candidates, :request_id
    add_index :spot_candidates, :spot_id
    add_index :spot_candidates, :user_id
  end
end
