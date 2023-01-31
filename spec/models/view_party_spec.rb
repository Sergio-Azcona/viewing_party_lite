require 'rails_helper'

RSpec.describe ViewParty, type: :model do
  it { should have_many(:view_party_users)}
  it { should have_many(:users).through(:view_party_users) }
end