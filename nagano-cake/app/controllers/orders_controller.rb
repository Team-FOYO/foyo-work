class OrdersController < ApplicationController
	def new
		@user = current_user
		@order = Order.new
	end

	def confirm
		@order = Order.new(order_params)
		@user = current_user.id
		@cart_item = CartItem.where(user_id: current_user.id)
		@delivery_charge = 800
	end

    def create
    	@user = current_user.id
    	@order = Order.new(order_params)
    	@order.user_id = current_user.id
    	@order.save
    	if @order.save
    		redirect_to confirm_orders_path
    	else
    		redirect_to root_path
    	end
    end

	def complete
	end

	def show
	end

	def index
	end

	private
	def order_params
    	params.permit(:address,:payment,)
  	end
end
