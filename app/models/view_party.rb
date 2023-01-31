class ViewParty < ApplicationRecord
  has_many :view_party_users
  has_many :users, through: :view_party_users
  
end
