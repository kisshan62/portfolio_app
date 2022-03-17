class StepsController < ApplicationController
  def new
    @goal = Goal.find(params[:id])
    @step = @goal.steps.build
  end

  def destroy
    @step = Step.find(params[:id])
    @step.destroy

    redirect_to goal_path
  end

  def done
    @step = Step.find(params[:id])
    @step.update_attribute(:done, true)
    redirect_to goal_path(@step.goal_id)
  end

  def undone
    @step = Step.find(params[:id])
    @step.update_attribute(:done, false)
    redirect_to goal_path(@step.goal_id)
  end
end
