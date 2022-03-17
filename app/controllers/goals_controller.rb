class GoalsController < ApplicationController

  #ユーザーのログイン状態を確かめる。
  before_action :authenticate_user!
  
  def new
    @goal = Goal.new
    @goal_steps = @goal.steps.build
  end

  def create
    @goal = current_user.goals.build(goal_params)
    if @goal.save
      flash[:notice] = "Goal created!"
      redirect_to root_path
    else
      flash.now[:alert] = "Goal failed create!"
      render :new
    end
  end

  def show
    @goal = Goal.find(params[:id])
    @comments = @goal.comments
  end

  def edit
    @goal = Goal.find(params[:id])
  end
  
  def update
    @goal = Goal.find(params[:id])

    if @goal.update(goal_params)
      redirect_to goal_path(@goal.id)
    else
      render :edit
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    redirect_to root_path
  end

  def done
    @goal = Goal.find(params[:id])
    @comments = @goal.comments
    @goal.update_attribute(:done, true)
    render "goals/show"
  end

  def undone
    @goal = Goal.find(params[:id])
    @comments = @goal.comments
    @goal.update_attribute(:done, false)
    render "goals/show"
  end

  private

    def goal_params
      params.require(:goal).permit(:title, :description, :start_date, :due_date, :keyword,
      steps_attributes: [:title, :description, :start_date, :due_date, :_destroy])
    end
end
