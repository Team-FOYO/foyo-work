class Admin::OrderItemsController < ApplicationController
	def update
		@order = Order.find(params[:id])
		@order_items = OrderItem.where(order_id: @order.id)
		@order_item.update(order_item_params)
  		redirect_back(fallback_location: root_path)
	end

	private
	def order_item_params
    	params.require(:order_item).permit(:item_id, :quantity,:status)
  	end
end
