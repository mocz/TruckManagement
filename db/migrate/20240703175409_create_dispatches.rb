class CreateDispatches < ActiveRecord::Migration[7.1]
  def change
    create_table :dispatches do |t|
      t.references :truck, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.references :planter, null: false, foreign_key: true
      t.date :receive_date
      t.integer :gross_weight
      t.string :status
      t.string :description

      t.timestamps
    end
  end
end
