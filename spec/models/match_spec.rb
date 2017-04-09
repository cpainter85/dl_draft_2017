require 'rails_helper'

describe Match do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:match) { build(:match, team1_id: user1.id, team2_id: user2.id) }

  describe '#team1' do
    it "returns the team with the corresponding team1_id" do
      expect(match.team1).to eq user1
    end
  end

  describe '#team2' do
    it "returns the team with the corresponding team2_id" do
      expect(match.team2).to eq user2
    end
  end
end
