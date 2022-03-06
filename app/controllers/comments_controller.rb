class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @goal = @comment.goal
    if @comment.save
      flash[:notice] = "Comment created!"
      @goal.create_notification_comment!(current_user, @comment.id)
      redirect_to goal_path(@comment.goal_id)
    else
      flash[:alert] = "Comment failed create!"
      redirect_to goal_path(@comment.goal_id)
    end
  end

  def destroy
  end

  private

    def comment_params
      params.permit(:content, :goal_id)
    end
end
