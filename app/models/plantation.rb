class Plantation < ApplicationRecord
  belongs_to :location
  belongs_to :planter
end
