require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it { should have_many(:view_party_users)}
  it { should have_many(:view_parties).through(:view_party_users) }

end
