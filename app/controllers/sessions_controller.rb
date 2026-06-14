class SessionsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:guest_sign_in]

    def guest_manager_sign_in
      manager = User.guest_manager
      sign_in manager
      redirect_to root_path, notice: "店長としてログインしました"
    end

    def guest_sign_in
      guest = User.guest
      sign_in guest
      redirect_to root_path, notice: "ゲストとしてログインしました"
    end
end
