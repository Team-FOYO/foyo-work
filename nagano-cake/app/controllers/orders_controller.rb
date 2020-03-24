class OrdersController < ApplicationController
	#before_action :authenticate_user!

	def new
		@user = User.find(current_user.id)
		@order = Order.new
		@delivery = Delivery.where(user_id: current_user.id)
	end

	def confirm
		@order = Order.new(order_params) #way(入金方法)をviewから受け取り
    	@order.user_id = current_user.id

    #--------radio_buttonの選択に応じた住所を登録する--------
	    selected_address = "" #変数宣言：orderに格納する住所
	    case params[:delivery_type] #radioボタンの選択箇所「1 or 2 or 3」で処理選択
	    when "1" then
	      @order.postal_code = params[:postal1]
	      @order.address = params[:address1]
	      @order.addressee = params[:name1]
	    when "2" then
	      @delivery_select = Delivery.find(params[:delivery_address][:id])
	      @order.postal_code = @delivery_select.postal_code
	      @order.address = @delivery_select.address
	      @order.addressee = @delivery_select.addressee
	    when "3" then
	      @order.postal_code = params[:postal3]
	      @order.address = params[:address3]
	      @order.addressee = params[:name3]
	    end

    #--------ユーザのカート内商品を@cart_productに格納--------
    	@cart_items = CartItem.where(user_id: current_user.id)
	end

    def create
    	@order = Order.new(order_params)
    	@order.user_id = current_user.id
    	@order.save!
    	@cart_items = current_user.cart_items.all
    	@cart_items.each do |cart_item|
    		@order_item = OrderItem.new
    		@order_item.item_id = cart_item.item_id
    		@order_item.quantity = cart_item.quantity
    		@order_item.unit_price = cart_item.item.tax
    		@order_item.order_id = @order.id
    		@order_item.status = 0
    		@order_item.save!
    	end
      	@cart_items.destroy_all
      	redirect_to complete_orders_path
    	
    end

	def complete
	end

	def show
		@order = Order.find(params[:id])
	end

	def index
		@user = User.find(current_user.id)
		@orders = @user.orders.page(params[:page]).reverse_order
	end

	private
	def delivery_params
    	params.require(:delivery_address).permit(:id)
  	end
	def order_params
    	params.require(:order).permit(:user_id, :postal_code, :address, :addressee,:delivery_charge, :charge, :payment, :status, :delivery)
  	end
end
