class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "ログインに成功しました"
      family_url(current_user)
    else
      flash[:notice] = "新規登録が完了しました"
      family_url(current_user)
    end
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトしました"
    families_path
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :Password])
  end
end
