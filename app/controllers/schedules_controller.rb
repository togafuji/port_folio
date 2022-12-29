class SchedulesController < ApplicationController
  require 'pry'
  
  def index
    @schedules = Schedule.where(user_id: current_user.id).all
    @schedule = Schedule.new
    @user = current_user
    @members = Member.where(user_id: current_user.id).all
  end
  
  def new
    @schedule = Schedule.new
    @user = current_user
  end

  def show
    @schedule = Schedule.find(params[:id])
    @user = current_user
  end

  def create
    Schedule.create(schedule_params)
    redirect_to user_schedules_path, status: :unprocessable_entity
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to user_schedules_path, notice:"削除しました"
  end

  def edit
    @schedule = Schedule.find(params[:id])
    @user = current_user
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to user_schedules_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title, :content, :start_time, :user_id, :member_id, :whoschedule)
  end
  
  def member_params
    params.require(:member).permit(:name, :user_id, :id)
  end
end
