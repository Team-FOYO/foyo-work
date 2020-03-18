class CartItemsController < ApplicationController
	def create
		@cart_items = Car
	end

	def index
		@cart_items = Cart_items.all
	end

	def update
		@cart_item = Cart_items.find(params[:id])
		if  @cart_item.update(book_params)
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
