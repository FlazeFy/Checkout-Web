class Place < ApplicationRecord
    validates :place_category, presence: true, length: { maximum: 36 }
    validates :place_name, presence: true, length: { maximum: 75 }
end
