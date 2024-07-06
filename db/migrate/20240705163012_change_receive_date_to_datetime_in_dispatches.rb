class ChangeReceiveDateToDatetimeInDispatches < ActiveRecord::Migration[7.1]
  def change
    change_column :dispatches, :receive_date, :datetime
  end
end
