FactoryGirl.define do
  factory :match do |f|
    f.team1_id { create(:user).id }
    f.team2_id { create(:user).id }
    f.round { 1 }
  end
end
