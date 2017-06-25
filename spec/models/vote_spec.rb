require 'rails_helper'

describe Vote do
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:match_id) }

    it { should validate_uniqueness_of(:user_id).scoped_to(:match_id) }

    describe '#user_cannot_be_match_participant' do
      let(:user) { create(:user) }
      let(:match) { create(:match, team1_id: user.id, team2_id: create(:user).id) }

      it "validates that user is not a match participant" do
        vote = match.votes.create(user_id: user.id, vote_for_team_id: match.team1_id)
        expect(vote.valid?).to eq false
      end
    end
  end

  describe 'relationships' do
    it { should belong_to(:match) }
    it { should belong_to(:user) }
  end
end
