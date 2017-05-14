class Vote < ApplicationRecord
  validates_uniqueness_of :user_id, scope: :match_id
end
