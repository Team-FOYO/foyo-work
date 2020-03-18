class Admin::ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
		@item_tax = @item.no_tax*1.1
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
  			render :new
  		end
	end

	def update

	end

	private
	def item_params
		params.require(:item).permit(:name,:description,:image,:no_tax,:genre_id,:is_active)
	end
end