class Truck < ApplicationRecord
    has_many :dispatches
    has_many :drivers

    def self.ransackable_attributes(auth_object = nil)
        ["capacity", "created_at", "id", "id_value", "license_plate", "truck_id", "updated_at"]
    end
end
