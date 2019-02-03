class RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new, :create]

  def create
    super
  end

  private

  def sign_up_params
    params.require(:user).permit( :username, 
                                  :avatar,
                                  :email, 
                                  :password, 
                                  :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit( :username, 
                                  :avatar,
                                  :email, 
                                  :password, 
                                  :password_confirmation, 
                                  :current_password)
  end

  def after_sign_up_path_for(resource)
    '/users'
  end

  protected

  def sign_up(resource_name, resource)
    true
  end
  
end