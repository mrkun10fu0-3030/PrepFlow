class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    unless current_user.manager? || @user == current_user
      redirect_to root_path, alert: "アクセス権限がありません"
    end
  end
end
