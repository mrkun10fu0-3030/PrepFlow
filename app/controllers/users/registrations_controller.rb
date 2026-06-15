class Users::RegistrationsController < Devise::RegistrationsController

  protected
  def update_resource(resources, params)
    resource.update_without_password(params)
  end

  def account_update_params
    params.require(:user).permit(:username)
  end

  def after_update_path_for(resource)
    user_path(current_user)
  end

  def account_update_params
    params.require(:user).permit(:usernmae, :avatar)
  end
end
