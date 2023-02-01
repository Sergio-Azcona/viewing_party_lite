require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'relationships and validations' do
    it { should have_many(:view_party_users)}
    it { should have_many(:view_parties).through(:view_party_users) }

    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email) }

  end
end
