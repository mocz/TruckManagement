class Dispatch < ApplicationRecord
  belongs_to :truck
  belongs_to :location
  belongs_to :planter
  after_create :generate_qr_code

  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "gross_weight", "id", "location_id", "planter_id", "qr_code", "receive_date", "status", "truck_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["truck", "location", "planter"]
  end

  private

  def generate_qr_code
    qr_code_content = "#{id}"
    qrcode = RQRCode::QRCode.new(qr_code_content)
    self.qr_code = qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6
    )
    save!
  end
end
