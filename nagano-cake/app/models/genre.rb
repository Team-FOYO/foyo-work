class Genre < ApplicationRecord

	has_one :item

	validates :name ,presence: true
    validates :is_active ,presence: true

	def if_is_active
		yuukou = "有効"
		mukou = "無効"
		if true == is_active
			yuukou
		else
			mukou
		end
	end
end
