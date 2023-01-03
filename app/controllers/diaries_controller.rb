class DiariesController < ApplicationController
  
  def index
    @diaries = Diary.where(user_id: current_user.id).all
    @diary = Diary.new
    @user = current_user
  end
  
  def show
    @diary = Diary.find(params[:id])
    @user = current_user
    @members = Member.where(user_id: current_user.id).all
    @comments = @diary.comments  
    @comment = @user.comments.new
  end
  
  def new
    @diary = Diary.new
    @user = current_user
    @members = Member.where(user_id: current_user.id).all
  end
  
  def create
    Diary.create(diary_params)
    redirect_to user_diaries_path
  end
  
  def destroy
    @diary = Diary.find(params[:id])
    @diary.destroy
    redirect_to user_diaries_path, notice:"日記を削除しました"
  end
  
  private

  def diary_params
    params.require(:diary).permit(:id, :title, :body, :when_diary, :avatar, :user_id, :whodiary)
  end
end
