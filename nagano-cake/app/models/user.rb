class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries
  has_many :orders
  has_many :cart_items

  	def if_is_active
		yuukou = "有効"
		taikai = "退会済み"
		if true == is_active
			yuukou
		else
			taikai
		end
	end
end
