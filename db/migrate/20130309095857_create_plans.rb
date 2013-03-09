class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :title, limit:45
      t.integer :user_id
      t.integer :request_id
      t.boolean :purchased

      t.timestamps
    end
    add_index :plans, :user_id
    add_index :plans, :request_id
  end
end
