class Order < ApplicationRecord

	belongs_to :user

	has_many :order_items

	validates :user_id ,presence: true
    validates :payment ,presence: true
    validates :postal_code ,presence: true
    validates :address ,presence: true
    validates :addressee ,presence: true
    validates :delivery_charge ,presence: true
    validates :charge ,presence: true
    validates :status ,presence: true

end
