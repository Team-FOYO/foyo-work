class Delivery < ApplicationRecord

	belongs_to :user
	belongs_to :order

	validates :user_id ,presence: true
    validates :postal_code ,presence: true
    validates :address ,presence: true
    validates :addressee ,presence: true


    def total_address
    	"#{postal_code} #{address} #{addressee}"
 	end
end
