class DraftPicksController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @draft_pick = @user.draft_picks.new(round_drafted: @user.default_round)
  end

  def create
    @user = User.find(params[:user_id])
    @draft_pick = @user.draft_picks.new(draft_pick_params)
    if @draft_pick.save
      redirect_to root_path, notice: "#{@draft_pick.name} has been added to your team!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @draft_pick = @user.draft_picks.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @draft_pick = @user.draft_picks.find(params[:id])
    if @draft_pick.update(draft_pick_params)
      redirect_to user_path(@user), notice: "#{@draft_pick.name} successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    draft_pick = @user.draft_picks.find(params[:id])
    draft_pick.destroy
    redirect_to user_path(@user), notice: "#{draft_pick.name} was successfully deleted."
  end

  private

  def draft_pick_params
    params.require(:draft_pick).permit(:name, :category_id, :round_drafted, :user_id)
  end
end
