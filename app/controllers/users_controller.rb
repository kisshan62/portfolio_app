class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @goals = @user.goal.all.order("created_at DESC")
  end
end