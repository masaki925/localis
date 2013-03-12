class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name, limit:45
      t.text :description

      t.timestamps
    end
  end
end