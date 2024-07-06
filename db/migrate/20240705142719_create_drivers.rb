class CreateDrivers < ActiveRecord::Migration[7.1]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :license_number
      t.string :contact_number
      t.string :address
      t.date :birthdate
      t.string :status

      t.timestamps
    end
  end
end
