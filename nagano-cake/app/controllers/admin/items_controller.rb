class Admin::ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def show

	end

	def new
		@item = Item.new
	end

	def edit

	end

	def create
  		@item = Item.new(item_params)
      	if @item.save
  			redirect_to admin_items_path
  		else
  			render new_admin_item_path
  		end
	end

	def update

	end

	private
	def item_params
		params.require(:item).permit(:genre_id,:name,:description,:image,:no_tax,:is_active)
	end
end