class UsersController < ApplicationController
  def show
    @user = User.includes(:draft_picks).find(params[:id])
    @categories = Category.all
  end
end
