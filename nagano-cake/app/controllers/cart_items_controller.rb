class CartItemsController < ApplicationController

	def index
    	@cart = Item.find(session[:cart])
    	@cart_item = CartItem.new
  	end

  	def create
    	@item = Item.find(params[:id])
		session[:cart] << @item
    	redirect_to root_path
 	end

 	def update
    if  @cart_item.update(cart_item_params)
        redirect_back(fallback_location: root_path)
    else
        render :index
    end
  end

	def destroy

	end

	def all_destroy
	end


end
