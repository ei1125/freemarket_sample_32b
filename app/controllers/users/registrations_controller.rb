# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:new, :create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
  end
  
  # POST /resource
  def create
    # binding.pry
    @user = User.new(identity_params)
    # 後ほど使用
    # @user.build_identity
    # @user.adresses.build
    @user.save
    redirect_to users_path #とりあえずマイページへ
  end

  # GET /resource/edit
  # def edit
  # end

  # PUT /resource
  # def update
  # end

  # DELETE /resource
  # def destroy
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  # end

  private
  def identity_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, identity_attributes:[:id, :familyname, :firstname, :familyname_kana, :firstname_kana, :birthday])
  end
  # params.permit(:sign_up, keys: [:nickname, identities_attributes: [:id, :familyname, :firstname, :familyname_kana, :firstname_kana, :birthday]])

  # def authentication_phonenumber_params
  #   params.require(:authentication_phonenumber).permit(:authentication_phonenumber) 
  # end


  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   root_path(resource)
  # end
end
