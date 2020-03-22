class Admin::OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def edit
		@order = Order.find(params[:id])
		@order_items = Order_item.where(order_id: @order.id)
		@delivery_charge = 800
	end

	def update
		@order = Order.find(params[:id])
		if @order.update(order_params)
  			redirect_to edit_admin_order(@order), notice: "successfully updated"
  		else
  			render :edit
  		end
	end

	private
	def order_params
    	params.require(:order).permit(:address,:payment,:status)
  	end
end
