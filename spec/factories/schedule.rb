FactoryBot.define do
  factory :schedule do
    association :user
    association :member
    title { "test" }
    content { "test2" }
    whoschedule { "test3" }
    start_time { "2022-12-12" }
    created_at { "2022-12-12" }
    updated_at { "2022-12-12" }
  end
end
