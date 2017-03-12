class DraftController < ApplicationController
  def index
    @schedule ||= draft_schedule
  end

  private

  def draft_schedule
    schedule = {}
    users = User.all.order(:start_order).pluck(:id)
    (1..8).each do |num|
      schedule[num] = [users.dup, users.dup.reverse]
      users.push(users.shift)
    end
    schedule.each_pair do |k,v|
      schedule[k] = v.map {|users| users.map { |user| User.includes(:draft_picks).find(user) } }
    end
  end
end
