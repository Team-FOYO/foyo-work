class Admin::UsersController < ApplicationController
	def order_index
		@user = User.find(params[:id])
		@orders = Order.where(user_id: @user.id)
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
  		if @user.update(user_params)
  			redirect_to admin_user_path(@user), notice: "successfully updated user!"
  		else
  			render :edit
  		end
	end

	private
	  def user_params
  			params.require(:user).permit(:first_name, :last_name,:first_name_kana,:last_name_kana,:email,:postcode,:address,:phone_number, :is_active )
      end
end
