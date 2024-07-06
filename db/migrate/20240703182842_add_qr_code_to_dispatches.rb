class AddQrCodeToDispatches < ActiveRecord::Migration[7.1]
  def change
    add_column :dispatches, :qr_code, :text
  end
end
