class SearchesController < ApplicationController
  def search
    # Viewのformで取得した:rangeをモデルに渡す
    @range = params[:search][:range]
    if @range == "User"
      @users = User.search(params[:search][:keyword], params[:search][:search_pattern])
      # binding.pry
    elsif @range == "Goal"
      @goals = Goal.search(params[:search][:keyword], params[:search][:search_pattern])
    else
      @comments = Comment.search(params[:search][:keyword], params[:search][:search_pattern])
    end
  end
end