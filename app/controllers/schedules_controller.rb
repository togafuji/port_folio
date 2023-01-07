class SchedulesController < ApplicationController
  
  def index
    @schedules = Schedule.where(user_id: current_user.id).all.order(start_time: :asc)
    @schedule = Schedule.new
    @user = current_user
    @members = Member.where(user_id: current_user.id).all
  end
  
  def new
    @schedule = Schedule.new
    @user = current_user
    @members = Member.where(user_id: @user).all
  end

  def show
    @user = current_user
    @schedule = Schedule.find(params[:id])
  end

  def create
     @schedule = Schedule.new(schedule_params)
     @user = current_user
     @members = Member.where(user_id: @user).all
    if @schedule.save
       redirect_to user_schedules_path, notice:"スケジュールを作成しました"
    else 
       render 'new'
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to user_schedules_path, notice:"削除しました"
  end

  def edit
    @schedule = Schedule.find(params[:id])
    @members = Member.where(user_id: current_user.id).all
    @user = current_user
  end
  
  def search
    @user = current_user
    @schedules = Schedule.where(user_id: current_user.id).search(params[:keyword])
    @keyword = params[:keyword]
    @numbers = @schedules.count
  end

  def update
    @schedule = Schedule.find(params[:id])
    @user = current_user
    @members = Member.where(user_id: current_user.id).all
    if @schedule.update(schedule_params)
      redirect_to user_schedules_path(current_user), notice: "スケジュールを編集しました"
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
