class Admin::ItemsController < ApplicationController
	def index

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
  		@item.genre_id =
    	if @item.save #入力されたデータをdbに保存する。
  			redirect_to items_path
  		else
  			render 'new'
  		end
	end

	def update

	end

	private
	def item_params
		params.require(:item).permit(:genre_id,:name,:description, :image_id ,:no_tax , :is_active)
	end
end