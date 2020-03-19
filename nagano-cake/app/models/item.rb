class Item < ApplicationRecord
	belongs_to :genre
	attachment :image

	has_many :cart_items
	has_many :order_items

	validates :genre_id ,presence: true
    validates :name ,presence: true
    validates :description ,presence: true
    validates :image_id ,presence: true
    validates :no_tax ,presence: true


    def tax
    	no_tax * 1.1
    end
end
