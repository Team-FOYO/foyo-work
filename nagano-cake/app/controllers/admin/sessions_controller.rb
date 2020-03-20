# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # layout "admin/sessions/new"
  # before_action :configure_sign_in_params, only: [:create]

  #GET /resource/sign_in
  #def new
  #  super
  #end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    redirect_to admin_homes_top_path
  end

  # DELETE /resource/sign_out
  def after_sign_out_path_for(resource)
     new_admin_admin_session_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
