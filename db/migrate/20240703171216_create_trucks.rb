class CreateTrucks < ActiveRecord::Migration[7.1]
  def change
    create_table :trucks do |t|
      t.string :license_plate
      t.integer :capacity
      t.string :truck_id

      t.timestamps
    end
  end
end
