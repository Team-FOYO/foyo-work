class ItemsController < ApplicationController

	def index
		@items = Item.all
		@genres = Genre.all
		@genre = Genre.find(params[:id])
	end

	def show
		@item = Item.find(params[:id])
		@cart_item = CartItem.new
		@genres = Genre.all
	end
end