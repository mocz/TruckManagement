class Planter < ApplicationRecord
    has_many :dispatches
    has_many :plantations

    def self.ransackable_attributes(auth_object = nil)
        %w[id name created_at updated_at]
      end
end
