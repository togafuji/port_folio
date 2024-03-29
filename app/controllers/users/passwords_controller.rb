class Users::PasswordsController < Devise::PasswordsController
  before_action :ensure_general_user, only: :create

  def ensure_general_user
    if params[:user][:email].downcase == "guest@example.com"
      redirect_to new_user_session_path, alert: "ゲストユーザーのパスワード再設定はできません"
    end
  end
end
