class DraftController < ApplicationController
  def index
    @schedule ||= draft_schedule
    @draft_pick ||= current_user.draft_picks.new(round_drafted: current_user.default_round)
  end

  private

  def draft_schedule
    schedule = {}
    users = User.all.order(:start_order).pluck(:id)
    Round.regular_play_rounds.each do |num|
      schedule[num] = [users.dup, users.dup.reverse]
      users.push(users.shift)
    end
    schedule.each_pair do |k,v|
      schedule[k] = v.map {|users| users.map { |user| User.includes(:draft_picks).find(user) } }
    end
  end
end
