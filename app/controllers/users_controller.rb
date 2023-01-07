class UsersController < ApplicationController
  
  def update
    if @user.update(user_params)
      redirect_to families_path(current_user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

 private
  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
