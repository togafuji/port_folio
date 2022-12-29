class MembersController < ApplicationController
  def new
    @member = Member.new
    @user = current_user
  end
  
  def create
    Member.create(member_params)
    redirect_to user_schedules_path
  end
  
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to user_schedules_path, notice:"ファミリーメンバーを削除しました"
  end
  
  private

  def schedule_params
    params.require(:schedule).permit(:title, :content, :start_time, :user_id, :member_id, :whoschedule)
  end
  
  def member_params
    params.require(:member).permit(:name, :user_id)
  end
end
