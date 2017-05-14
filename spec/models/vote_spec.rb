require 'rails_helper'

describe Vote do
  describe 'validations' do
    it { should validate_uniqueness_of(:user_id).scoped_to(:match_id) }
  end
end
