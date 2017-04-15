class Match < ApplicationRecord
  has_many :votes

  def complete?
    User.all
      .reject { |user| user.match_participant?(self) }
      .none? { |user| user.has_not_voted_on_match?(self) }
  end

  def team1
    User.includes(:draft_picks).find(team1_id)
  end

  def team2
    User.includes(:draft_picks).find(team2_id)
  end

  def votes_for_team(team)
    self.votes.where(vote_for_team_id: team.id).size
  end
end
