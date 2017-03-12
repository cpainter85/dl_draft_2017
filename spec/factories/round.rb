FactoryGirl.define do
  factory :round, aliases: [:regular_play_round ]do
    name "Regular"
    number_of_rounds 8

    factory :semi_final_round do
      name "Semi-Final"
      number_of_rounds 1
    end

    factory :final_round do
      name "Final"
      number_of_rounds 1
    end
  end
end
