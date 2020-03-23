class ItemsController < ApplicationController
	#before_action :authenticate_user!,except:[:index,:show]

	def index
		@genres = Genre.all
		@items = Item.all
	end

	def searched_index
		@genre = Genre.find(params[:id])
		@genres = Genre.all
	end

	def show
		@item = Item.find(params[:id])
		@cart_item = CartItem.new
		@genres = Genre.all
	end
end