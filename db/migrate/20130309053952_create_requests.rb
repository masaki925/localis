class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.string :title
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.integer :people_num
      t.float :budget_hotel
      t.float :budget_meal
      t.boolean :option_transport
      t.boolean :option_edit
      t.boolean :option_pdf
      t.boolean :option_booking
      t.boolean :option_guide
      t.boolean :option_qa

      t.timestamps
    end
  end
end
