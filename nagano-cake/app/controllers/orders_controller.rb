class OrdersController < ApplicationController
	def new
		@delivery = current_user.deliveries
		@user = current_user
		@order = Order.new
	end

	def confirm
	end

    def create
    	@cart_item = CartItem.new(cart_item_params)
    	@cart_item.user_id = current_user.id
    	@cart_item.save
    	redirect_to orders_path
    end

	def complete
	end

	def show
	end

	def index
	end

	private

	
end
