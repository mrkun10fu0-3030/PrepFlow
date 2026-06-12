class Users::RegistrationsController < Devise::RegistrationsController

  protected
  def update_resources(resources, params)
    resource.update_without_password(params)
  end

  def account_update_params
    params.require(:user).permit(:username, :password)
  end
end
