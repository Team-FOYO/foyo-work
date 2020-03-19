class Item < ApplicationRecord
	belongs_to :genre
	attachment :image

	has_many :cart_items
	has_many :order_items

	validates :genre_id ,presence: true
    validates :name ,presence: true
    validates :description ,presence: true
    validates :no_tax ,presence: true

	def if_is_active
		hanbai = "販売中"
		urikire = "売り切れ"
		if true == is_active
			hanbai
		else
			urikire
		end
	end

    def tax
    	@tax = no_tax * 1.1
    	@tax.floor
    end

end
