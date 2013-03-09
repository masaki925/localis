class CreateSpotCategories < ActiveRecord::Migration
  def change
    create_table :spot_categories do |t|
      t.string :name, limit:45

      t.timestamps
    end
  end
end
