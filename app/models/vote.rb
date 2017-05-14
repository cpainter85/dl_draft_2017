class Vote < ApplicationRecord
  belongs_to :match
  belongs_to :user

  validates_uniqueness_of :user_id, scope: :match_id
  validate :user_cannot_be_match_participant

  def user_cannot_be_match_participant
    errors.add(:user_id, "user can't be a match participant") if user.match_participant?(match)
  end
end
