require 'rails_helper'

describe Match do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:match) { create(:match, team1_id: user1.id, team2_id: user2.id) }

  describe 'relationships' do
    it { should have_many(:votes) }
  end

  describe '#complete?' do
    let(:eligible_voters) { create_list(:user, 4) }

    subject { match.complete? }

    context "match is complete" do
      before :each do
        eligible_voters.each { |voter| voter.votes.create(match_id: match.id, vote_for_team_id: match.team1_id ) }
      end

      it { is_expected.to eq true }
    end

    context "match is incomplete" do
      before :each do
        eligible_voters.first.votes.create(match_id: match.id, vote_for_team_id: match.team2_id)
      end

      it { is_expected.to eq false }
    end
  end

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

  describe "votes_for_team" do
    subject { match.votes_for_team(user1) }

    it "returns the votes for the given team" do
      create(:user).votes.create(match_id: match.id, vote_for_team_id: user1.id)
      expect(subject).to eq 1
    end

    context "No votes for the team" do
      it { is_expected.to eq 0 }
    end
  end
end
