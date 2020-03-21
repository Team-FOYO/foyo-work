class Admin::HomesController < ApplicationController
	def top
		@orders = Order.created_today
	end

end
