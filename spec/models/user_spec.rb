require 'rails_helper'

describe User do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_numericality_of(:finals_order).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:semifinals_order).is_greater_than_or_equal_to(0) }
  end

  describe 'relationships' do
    it { should have_many(:draft_picks) }
    it { should have_many(:categories) }
    it { should have_many(:votes) }
  end

  describe 'scopes' do
    describe '::finalists' do
      let!(:non_finalist) { create(:user, finals_order: 0) }
      let!(:first_finalist) { create(:user, finals_order: 1) }
      let!(:third_finalist) { create(:user, finals_order: 3) }
      let!(:second_finalist) { create(:user, finals_order: 2) }

      it "returns all finalists in ascending order" do
        expect(User.finalists).not_to include non_finalist
        expect(User.finalists).to eq [first_finalist, second_finalist, third_finalist]
      end
    end

    describe '::semifinalists' do
      let!(:non_semifinalist) { create(:user, semifinals_order: 0) }
      let!(:first_semifinalist) { create(:user, semifinals_order: 1) }
      let!(:third_semifinalist) { create(:user, semifinals_order: 3) }
      let!(:second_semifinalist) { create(:user, semifinals_order: 2) }

      it "returns all semifinalists in ascending order" do
        expect(User.semifinalists).not_to include non_semifinalist
        expect(User.semifinalists).to eq [first_semifinalist, second_semifinalist, third_semifinalist]
      end
    end
  end

  describe '#is_finalist?' do
    context "user has a finals_order greater than 0" do
      let(:user) { build(:user, finals_order: 2) }

      it "returns true" do
        expect(user.is_finalist?).to eq true
      end
    end

    context "user has a finals_order of 0" do
      let(:user) { build(:user, semifinals_order: 0) }

      it "returns false" do
        expect(user.is_finalist?).to eq false
      end
    end
  end

  describe '#is_semifinalist?' do
    context "user has a semifinals_order greater than 0" do
      let(:user) { build(:user, semifinals_order: 2) }

      it "returns true" do
        expect(user.is_semifinalist?).to eq true
      end
    end

    context "user has a semifinals_order of 0" do
      let(:user) { build(:user, semifinals_order: 0) }

      it "returns false" do
        expect(user.is_semifinalist?).to eq false
      end
    end
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

  describe '#team_abbr_and_name' do
    let(:user) { build(:user, first_name: 'Charlie', team_abbr: 'JLA') }

    it "returns a string of the team_abbr and user's first name" do
      expect(user.team_abbr_and_name).to eq "JLA (Charlie)"
    end
  end
end
