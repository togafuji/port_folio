class Users::SessionsController < Devise::SessionsController
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def guest_sign_in
    user = User.find_or_create_by(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー" 
    end
    sign_in user
    redirect_to family_url(current_user), notice: 'ゲストユーザーとしてログインしました。'
  end
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :Password])
  end
end
