class Admin::HomesController < ApplicationController
	#before_action :authenticate_admin_admin!

	def top
		@orders = Order.created_today
	end

end
