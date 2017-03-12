require 'rails_helper'

describe Round do
  describe "validations" do
    it { should validate_numericality_of(:number_of_rounds).is_greater_than_or_equal_to(1) }
  end

  describe "::regular_play_rounds" do
    subject { Round.regular_play_rounds }

    context "'Regular' round is set" do
      let!(:regular_round) { create(:regular_play_round, number_of_rounds: 6) }

      it "should return a range containing all regular play round numbers" do
        expect(subject).to eq (1..6)
      end
    end

    context "No 'Regular' round is set" do
      it { is_expected.to eq [] }
    end
  end

  describe "::semi_final_rounds" do
    subject { Round.semi_final_rounds }

    context "'Regular' and 'Semi-Final' rounds are set" do
      let!(:regular_play_round) { create(:regular_play_round, number_of_rounds: 8) }
      let!(:semi_final_round) { create(:semi_final_round, number_of_rounds: 2) }

      it "should return a range containing all semi-final round numbers" do
        expect(subject).to eq (9..10)
      end
    end

    context "No 'Regular' round is set" do
      let!(:semi_final_round) { create(:semi_final_round) }

      it { is_expected.to eq [] }
    end

    context "No 'Semi-Final' round is set" do
      let!(:regular_play_round) { create(:regular_play_round) }

      it { is_expected.to eq [] }
    end
  end

  describe "::final_rounds" do
    subject { Round.final_rounds }

    context "'Regular', 'Semi-Final', and 'Final' rounds are set" do
      let!(:regular_play_round) { create(:regular_play_round, number_of_rounds: 8) }
      let!(:semi_final_round) { create(:semi_final_round, number_of_rounds: 2) }
      let!(:final_round) { create(:final_round) }

      it "should return a range containing all semi-final round numbers" do
        expect(subject).to eq (11..11)
      end
    end

    context "No 'Regular' round is set" do
      let!(:semi_final_round) { create(:semi_final_round, number_of_rounds: 2) }
      let!(:final_round) { create(:final_round) }

      it { is_expected.to eq [] }
    end

    context "No 'Semi-Final' round is set" do
      let!(:regular_play_round) { create(:regular_play_round, number_of_rounds: 8) }
      let!(:final_round) { create(:final_round) }

      it { is_expected.to eq [] }
    end

    context "No 'Final' round is set" do
      let!(:regular_play_round) { create(:regular_play_round, number_of_rounds: 8) }
      let!(:semi_final_round) { create(:semi_final_round, number_of_rounds: 2) }
      
      it { is_expected.to eq [] }
    end
  end

end
