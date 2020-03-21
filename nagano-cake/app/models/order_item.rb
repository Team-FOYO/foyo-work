class OrderItem < ApplicationRecord

	belongs_to :item
	belongs_to :order

    validates :order_id ,presence: true
    validates :item_id ,presence: true
    validates :unit_price ,presence: true
    validates :quantity ,presence: true
    validates :status ,presence: true

    def subtotal
		unit_price*.quantity
	end
end
