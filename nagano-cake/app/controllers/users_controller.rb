class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
	   @user = User.find(params[:id])
  		if @user.update(user_params)
  			redirect_to user_path(current_user), notice: "successfully updated user!"
  		else
  			render :edit
  		end
	end

	def leave
	end

	private
	  def user_params
  			params.require(:user).permit(:first_name, :last_name,:first_name_kana,:last_name_kana,:email,:postcode,:address,:phone_number)
      end