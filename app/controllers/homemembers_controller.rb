class HomemembersController < ApplicationController
  def new
    @homemember = Homemember.new
    @user = current_user
  end

  def create
    @user = current_user
    @homemember = Homemember.new(homemember_params)
    if @homemember.save
      redirect_to user_schedules_path, notice: "家族を追加しました"
    else
      render 'new'
    end
  end

  def edit
    @homemember = Homemember.find(params[:id])
    @user = current_user
  end

  def update
    @homemember = Homemember.find(params[:id])
    if @homemember.update(homemember_params)
      redirect_to user_schedules_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @homemember = Homemember.find(params[:id])
    @homemember.destroy
    redirect_to user_schedules_path, notice: "ファミリーメンバーを削除しました"
  end

  private

  def homemember_params
    params.require(:homemember).permit(:id, :name, :user_id)
  end
end
