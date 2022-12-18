class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました" 
      family_url(current_user)
    else
      flash[:notice] = "新規登録完了しました" 
      family_url(current_user)
    end
  end
  
  def after_destroy_user_session_path
    families_path
  end
  
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :Password])
  end
end
