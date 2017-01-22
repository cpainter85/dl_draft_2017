require 'rails_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of(:email) }
  end

  describe 'relationships' do
    it { should have_many(:draft_picks) }
    it { should have_many(:categories) }
    it { should have_many(:votes) }
  end

  describe '#full_name' do
    let(:user) { build(:user, first_name: "Joe", last_name: "Somebody") }

    it "returns a string with the user's full name (first and last name)" do
      expect(user.full_name).to eq "Joe Somebody"
    end
  end
  
  describe '#team_abbr' do
    context "User does not have a custom team_abbr" do
      let(:user) { build(:user, team_name: "Justice League of America") }

      it "returns uses the first letter of each word in the team name to create a team_abbr (ignoring lower case first letters)" do
        expect(user.team_abbr).to eq "JLA"
      end
    end

    context "User has a custom team_abbr" do
      let(:user) { build(:user, team_abbr: "bxtr") }

      it "returns the custom team_abbr in all uppercase" do
        expect(user.team_abbr).to eq "BXTR"
      end
    end
  end
end
