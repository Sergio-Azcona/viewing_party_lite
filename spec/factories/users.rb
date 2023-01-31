FactoryBot.define do
  factory :user do
    name { Faker::Music::RockBand.name}
    email { Faker::Internet.email  }
  end
end
