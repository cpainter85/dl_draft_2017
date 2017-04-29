class MatchesController < ApplicationController
  def index
    @round = params[:round_id].to_i
    @matches = Match.where(round: @round)
  end

  def new
    @round = params[:round_id].to_i
    @match = Match.new(round: @round)
  end

  def create
    @round = params[:round_id].to_i
    @match = Match.new(match_params)
    @match.round = @round
    if @match.save
      redirect_to round_matches_path(@round), notice: "Match successfully added!"
    else
      render :new
    end
  end

  private

  def match_params
    params.require(:match).permit(:team1_id, :team2_id)
  end
end
