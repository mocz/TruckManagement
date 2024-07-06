class Location < ApplicationRecord
    has_many :dispatches
    has_many :plantations

    has_many :barangays, class_name: 'Location', foreign_key: 'parent_id'
    belongs_to :town, class_name: 'Location', optional: true

    # def self.ransackable_associations(auth_object = nil)
    #     ["dispatches", "plantations"]
    # end

    # def self.ransackable_attributes(auth_object = nil)
    #     ["barangay", "created_at", "id", "km_dist", "area_code", "town", "updated_at"]
    # end
end
