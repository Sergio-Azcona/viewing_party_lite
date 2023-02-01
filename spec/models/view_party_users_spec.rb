require 'rails_helper'

RSpec.describe ViewPartyUser, type: :model do
  it { should belong_to(:view_party) }
  it { should belong_to(:user) }
end