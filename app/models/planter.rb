class Planter < ApplicationRecord
    has_many :dispatches
    has_many :plantations

    def self.ransackable_associations(auth_object = nil)
        ["dispatches"]
    end

    def self.ransackable_attributes(auth_object = nil)
        ["name", "address", "mobile_number", "status", "created_at", "updated_at"]
    end
end
