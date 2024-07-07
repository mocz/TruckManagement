class Dispatch < ApplicationRecord
  belongs_to :truck
  belongs_to :location
  belongs_to :planter
  after_create :generate_qr_code

  
  def self.ransackable_attributes(auth_object = nil)
    %w[id truck_id location_id planter_id gross_weight status created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[truck location planter]
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
