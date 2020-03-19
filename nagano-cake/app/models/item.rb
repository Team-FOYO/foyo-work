class Item < ApplicationRecord
	belongs_to :genre
	attachment :image

	has_many :cart_items
	has_many :order_items

	validates :genre_id ,presence: true
    validates :name ,presence: true
    validates :description ,presence: true
    validates :image,presence: true
    validates :no_tax ,presence: true

<<<<<<< HEAD
	def if_is_active
		hanbai = "販売中"
		urikire = "売り切れ"
		if true == is_active
			hanbai
		else
			urikire
		end
	end
=======

    def tax
    	no_tax * 1.1
    end
>>>>>>> e2f242303ad8ae2f21615298ac33dd5d36346715
end
