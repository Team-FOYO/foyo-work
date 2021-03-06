class Admin::ItemsController < ApplicationController
	before_action :authenticate_admin_admin!

	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new
	end

	def edit
		@item = Item.find(params[:id])
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
		@item = Item.find(params[:id])
	  	if @item.update(item_params)
	  		redirect_to admin_item_path(@item), notice: "successfully updated!"
	  	else
	  		render :edit
	  	end
	end

	private
	def item_params
		params.require(:item).permit(:name,:description,:image,:no_tax,:genre_id,:is_active)
	end
end