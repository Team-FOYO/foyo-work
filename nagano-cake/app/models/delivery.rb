class Delivery < ApplicationRecord

	belongs_to :user

	validates :user_id ,presence: true
    validates :postal_code ,presence: true
    validates :address ,presence: true
    validates :addressee ,presence: true
end
