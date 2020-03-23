class Admin::OrdersController < ApplicationController
	#before_action :authenticate_admin_admin!

	def index
		@orders = Order.all
		@user = User.all
	end

	def edit
		@order = Order.find(params[:id])
		@order_items = OrderItem.where(order_id: @order.id)
		@delivery_charge = 800
	end

	def update
		@order = Order.find(params[:id])
		@order.update(order_params)
		@order_item.update(order_params)
  		redirect_back(fallback_location: root_path)
	end

	private
	def order_params
    	params.require(:order).permit(:user_id,:address,:payment,:status)
  	end
end
