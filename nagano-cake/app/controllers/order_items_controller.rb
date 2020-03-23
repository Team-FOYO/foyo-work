class OrderItemsController < ApplicationController
	before_action :set_user
	def create
		@order_item = OrderItem.new
		@order_item.save
    	@order_item.user_id = current_user.id
    	@order.save
	end

	def index
		@order = Order.find(params[:id])
		@order_items = @order.order_items.all
	end

	def new
		@order_item = OrderItem.new
		@cart_items = @user.cart_items.all
		@order = Order.new
	end

	private
	def set_user
		@user = current_user
	end
    def order_items_params
      params.require(:order_item).permit(:user_id, :item_id, :quantity)
    end
end
