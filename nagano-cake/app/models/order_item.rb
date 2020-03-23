class OrderItem < ApplicationRecord

	belongs_to :item
	belongs_to :order

    validates :order_id ,presence: true
    validates :item_id ,presence: true
    validates :unit_price ,presence: true
    validates :quantity ,presence: true
    validates :status ,presence: true

    enum status: {着手不可: 0, 制作待ち: 1, 製作中: 2, 制作完了: 3}

    def subtotal
		unit_price*quantity
	end
end
