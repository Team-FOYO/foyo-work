# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # layout "admin/sessions/new"
  # before_action :configure_sign_in_params, only: [:create]

  #GET /resource/sign_in
   def new
   end

  # POST /resource/sign_in
  def create
     redirect_to admin_homes_top_path
  end

  # DELETE /resource/sign_out
  def destroy
    redirect_to new_admin_admin_session_path
  end


  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
