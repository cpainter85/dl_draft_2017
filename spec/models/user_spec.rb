require 'rails_helper'

describe User do
  let(:user) { build(:user, first_name: "Joe", last_name: "Somebody") }

  describe '#full_name' do
    it "returns a string with the user's full name (first and last name)" do
      expect(user.full_name).to eq "Joe Somebody"
    end
  end
end
