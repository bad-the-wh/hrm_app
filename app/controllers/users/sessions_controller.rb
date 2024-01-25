# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    super do |user|
      if request.format.json? && user.errors.empty?
        render json: { success: true, user: user.as_json(only: [:id, :email]), csrf_token: form_authenticity_token }
        return
      end
    end
  end

  def destroy
    super do
      render json: { success: true }
      return
    end
  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
