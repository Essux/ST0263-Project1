class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.float :longitude
      t.float :latitude
      t.references :route, foreign_key: true

      t.timestamps
    end
  end
end
