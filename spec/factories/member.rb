FactoryBot.define do
  factory :member do
    association :user
    name { "test3" }
  end
end
