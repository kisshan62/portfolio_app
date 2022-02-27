class PagesController < ApplicationController
  def index
    redirect_to new_user_session_path unless user_signed_in?
    @goals = current_user.goals.all.order("created_at DESC") if current_user
    # @goal = current_user.goal
    # @goal = Goal.find(params[:goal])
  end

  # def new
  #   @goal = Goal.new
  # end

  # def create
  #   @goal = current_user.goal.build(goal_params)
  #   if @goal.save
  #     flash[:notice] = "Goal created!"
  #     redirect_to root_path
  #   else
  #     flash.now[:alert] = "Goal failed create!"
  #     render 'pages/index'
  #   end
  # end

  #   private

  # def goal_params
  #   params.require(:goal).permit(:title, :description)
  # end
end