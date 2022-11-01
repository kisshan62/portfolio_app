class FavoritesController < ApplicationController
  before_action :set_goal
  before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）

  # お気に入り登録
  def create
    # binding.pry
    @favorite = Favorite.create(user_id: current_user.id, goal_id: @goal.id)
    # @favorite = current_user.build(user_id: current_user.id, goal_id: @goal.id)
  end
  # お気に入り削除
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, goal_id: @goal.id)
    @favorite.destroy
  end

  private
  def set_goal
    @goal = Goal.find(params[:goal_id])
  end
end