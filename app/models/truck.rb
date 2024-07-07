class Truck < ApplicationRecord
    has_many :dispatches
    has_many :drivers
    
    def self.ransackable_attributes(auth_object = nil)
        %w[id license_plate created_at updated_at]
      end
end
