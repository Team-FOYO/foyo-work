class Genre < ApplicationRecord

	has_one :item

	validates :name ,presence: true
    validates :is_active ,presence: true

end
