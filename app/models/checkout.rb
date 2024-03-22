class Checkout < ApplicationRecord
    validates :checkout_type, presence: true, length: { maximum: 36 }
    validates :checkout_desc, presence: false, length: { maximum: 500 }
    validates :checkout_destination, presence: true, length: { maximum: 75 }
    validates :checkout_origin, presence: true, length: { maximum: 75 }
end