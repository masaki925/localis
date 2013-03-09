class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id, null:false
      t.string :username, null:false
      t.string :title, null:false, limit:45
      t.datetime :start_datetime, null:false
      t.datetime :end_datetime, null:false
      t.integer :people_num, null:false, default: 0
      t.float :budget_hotel, null:false, default: 0
      t.float :budget_meal, null:false, default: 0
      t.boolean :option_transport, null:false, default: 0
      t.boolean :option_edit, null:false
      t.boolean :option_pdf, null:false
      t.boolean :option_booking, null:false
      t.boolean :option_guide, null:false
      t.boolean :option_qa, null:false

      t.timestamps
    end
    add_index :requests, :user_id
  end
end
