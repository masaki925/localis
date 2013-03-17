class CreateSpots < ActiveRecord::Migration
  def change
    create_table :spots do |t|
      t.string :google_spot_id, null:false
      #TODO　request_formの作成中。spotsのCRUDが実装されたらコメントを外す。
      t.string :name#, null:false, limit:45

      t.string :address, limit:45
      t.string :tel, limit:45
      t.integer :take_time
      t.integer :spot_category_id
      t.float :cost
      t.string :station, limit:45

      t.timestamps
    end
    add_index :spots, :spot_category_id
  end
end
