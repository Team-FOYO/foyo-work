class OrdersController < ApplicationController
	def new
		@user = current_user
		@order = Order.new
		@deliveries = Delivery.where(user_id: current_user.id)
	end

	def confirm
		@order = Order.where(params[:id])
		@user = current_user.id
		@cart_items = CartItem.where(user_id: current_user.id)
		@delivery_charge = 800
	end

    def create
    	case params[:selected_btn]
      		when  '会員住所'
        		@order = Order.new(order_params)
        		@order.user_id = current_user.id
        		@order.postal_code = current_user.postcode
        		@order.address = current_user.address
        		@order.addressee = current_user.full_name.to_s
        		@order.save
        		redirect_to confirm_orders_path
      		when  "配送先登録住所"
        		@order = Order.new(order_params)
        		@order.user_id = current_user.id
        		@order.postal_code = Delivery.find(params[:order][:delivery]).postal_code
        		@order.address = Shipping.find(params[:order][:delivery]).address
        		@order.address_name = Shipping.find(params[:order][:delivery]).addressee
        		@order.save
        		redirect_to confirm_orders_path
      		when  "新しい住所"
        		@order = Order.new(order_params)
        		@order.user_id = current_user.id
        		@order.save
        		redirect_to confirm_orders_path
        	end
    end

	def complete
	end

	def show
	end

	def index
	end

	def update
			@cart_items = CartItem.where(user_id: current_user.id)
	        @cart_items.each do |cart_item|
			    @order_item = OrderItem.new
			    @order_item.order_id = @order.id
			    @order_item.item_id = cart_item.item_id
			    @order_item.quantity = cart_item.quantity
			    @order_item.unit_price = cart_item.item.price
			    @order_item.status = 1
			end
		 if @order_item.save
	        @cart_items = CartItem.where(user_id: current_user.id)
	        @cart_items.destroy_all
	        @user = current_user
	        redirect_to complete_orders_path
	    end
	end

	private
	def order_params
    	params.permit(:customer_id, :postcode, :address, :address_name,:delivery_charge, :charge, :payment, :status, :delivery)
  	end
end
