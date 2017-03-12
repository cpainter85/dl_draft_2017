class Round < ApplicationRecord
  validates_numericality_of :number_of_rounds, greater_than_or_equal_to: 1

  def self.regular_play_rounds
    Range.new(1, Round.find_by(name: "Regular").number_of_rounds) rescue []
  end

  def self.semi_final_rounds
    begin
      end_of_regular_play = Round.regular_play_rounds.end
      Range.new(
        end_of_regular_play+1,
        end_of_regular_play+Round.find_by(name: "Semi-Final").number_of_rounds
      )
    rescue
      []
    end
  end

  def self.final_rounds
    begin
      end_of_semi_finals = Round.semi_final_rounds.end
      Range.new(
        end_of_semi_finals+1,
        end_of_semi_finals+Round.find_by(name: "Final").number_of_rounds
      )
    rescue
      []
    end
  end
end
