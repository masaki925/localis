class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.references :request
      t.references :user

      t.timestamps
    end
    add_index :candidates, :request_id
    add_index :candidates, :user_id
  end
end
