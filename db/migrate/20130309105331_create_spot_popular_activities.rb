class CreateSpotPopularActivities < ActiveRecord::Migration
  def change
    create_table :spot_popular_activities do |t|
      t.integer :spot_id
      t.integer :activity_id

      t.timestamps
    end
    add_index :spot_popular_activities, :spot_id
    add_index :spot_popular_activities, :activity_id
  end
end
