require 'rails_helper'

describe DraftPick do
  describe 'relationships' do
    it { should belong_to(:category) }
  end
end
