FactoryBot.define do
  factory :homemember do
    association :user
    name { "test3" }
  end
end
