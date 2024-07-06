class CreatePlanters < ActiveRecord::Migration[7.1]
  def change
    create_table :planters do |t|
      t.string :name
      t.string :address
      t.string :mobile_number
      t.string :status

      t.timestamps
    end
  end
end
