class User < ApplicationRecord
  has_many :view_party_users
  has_many :view_parties, through: :view_party_users

  validates_presence_of :name, :email
  validates_uniqueness_of :email
end
