class CreateLocations < ActiveRecord::Migration
  def up
    create_table :locations do |t|
      t.string :name, null: false
      t.string :street, null: false
      t.string :city, null: false
      t.string :town, null: false

      t.timestamps
    end
  end

  def down
    drop_table :locations
  end
end
