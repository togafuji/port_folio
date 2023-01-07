class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_general_user, only: [:update, :destroy]

  def ensure_general_user
    if resource.email == "guest@example.com"
      redirect_to family_url(current_user), notice: "ゲストユーザーの変更・削除はできません"
    end
  end
  
end
