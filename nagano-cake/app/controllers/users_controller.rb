class UsersController < ApplicationController
	#before_action :authenticate_user!

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
		@user = current_user
	end

	def active_leave
	   @user = current_user
	   @user.update(is_active: false)
       reset_session
       flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
       redirect_to root_path
	end

	private
	  def user_params
  			params.require(:user).permit(:first_name, :last_name,:first_name_kana,:last_name_kana,:email,:postcode,:address,:phone_number, :is_active )
      end

end