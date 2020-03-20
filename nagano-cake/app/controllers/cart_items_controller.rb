class CartItemsController < ApplicationController

	def index
    	@cart_item = CartItem.where(user_id: current_user.id)
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.user_id = current_user.id
    @cart_item.save
    redirect_to cart_items_path
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
    user = User.find(current_user)
    cart_items = CartItem.find(cart_item_params)
    cart_item = user.cart_items
    cart_item.destroy
    redirect_back(fallback_location: root_path)

    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    following.destroy
    redirect_back(fallback_location: root_path)
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end
end
