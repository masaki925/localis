class CreateSpotPopularMenus < ActiveRecord::Migration
  def change
    create_table :spot_popular_menus do |t|
      t.integer :spot_id
      t.integer :menu_id

      t.timestamps
    end
  end
end
