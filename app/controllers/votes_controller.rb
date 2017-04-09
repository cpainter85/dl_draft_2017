class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.js { }
        format.json { render json: @vote, status: :created }
      end
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:match_id, :vote_for_team_id)
  end
end
