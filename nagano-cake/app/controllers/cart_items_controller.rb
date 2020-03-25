class CartItemsController < ApplicationController
  before_action :authenticate_user!

	def index
    	@cart_item = CartItem.where(user_id: current_user.id)
      @user = current_user
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.user_id = current_user.id
    if @cart_item.quantity.nil?
      redirect_back(fallback_location: root_path) and return
    else
      @cart_item.save
      redirect_to cart_items_path
    end
 	end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_back(fallback_location: root_path)
  end

  def all_destroy
    @cart_items = current_user.cart_items.all
    @cart_items.destroy_all
    redirect_back(fallback_location: root_path)
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end
end