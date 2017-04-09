class MatchesController < ApplicationController
  def index
    @round = params[:round_id]
    @matches = Match.where(round: @round)
  end
end
