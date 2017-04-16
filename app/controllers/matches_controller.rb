class MatchesController < ApplicationController
  def index
    @round = params[:round_id].to_i
    @matches = Match.where(round: @round)
  end
end
