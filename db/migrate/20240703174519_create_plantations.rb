class CreatePlantations < ActiveRecord::Migration[7.1]
  def change
    create_table :plantations do |t|
      t.string :name
      t.references :location, null: false, foreign_key: true
      t.integer :area

      t.timestamps
    end
  end
end
