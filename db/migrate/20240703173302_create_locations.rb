class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.string :barangay
      t.string :town
      t.string :area_code
      t.integer :km_dist

      t.timestamps
    end
  end
end
