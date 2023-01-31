class User < ApplicationRecord
  has_many :view_party_users
  has_many :view_parties, through: :view_party_users
end
