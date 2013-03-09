class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name,limit:45
      t.text :description

      t.timestamps
    end
  end
end
