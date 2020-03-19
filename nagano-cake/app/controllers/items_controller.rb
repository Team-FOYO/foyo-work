class ItemsController < ApplicationController

	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
	end
end



	private
		def cart_item_params
			params.require(:cart_items).permit(:quantity)
		end