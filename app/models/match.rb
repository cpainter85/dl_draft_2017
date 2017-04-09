class Match < ApplicationRecord
  def team1
    User.includes(:draft_picks).find(team1_id)
  end

  def team2
    User.includes(:draft_picks).find(team2_id)
  end
end
