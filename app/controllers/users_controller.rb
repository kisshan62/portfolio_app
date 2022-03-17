class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show]

  def show
    @user = User.find(params[:id])
    @goals = @user.goals.all.order("created_at DESC")
    @done_goals = @user.goals.where(done:true)
    @undone_goals = @user.goals.where(done:false)
    @following_goals = Goal.none
    @user.followings.each do |f|
      @following_goals = @following_goals.or(Goal.where(user_id: "#{f.id}"))
    end
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end
