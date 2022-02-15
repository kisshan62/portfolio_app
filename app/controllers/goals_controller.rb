class GoalsController < ApplicationController
  def index
    @goals = @user.goals.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.create
    if @goal.save
      #saveが完了したら、一覧ページへリダイレクト
      redirect_to root_path
    else
      #saveを失敗すると新規作成ページへ
      render new_user_goal_path
    end
  end

  def edit
  end

  def show
  end
  
  def update
  end
  
  def destroy
  end
end
