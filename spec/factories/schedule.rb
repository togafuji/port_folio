FactoryBot.define do
  factory :schedule do
    association :user
    title { "test" }
    content { "test2" }
    whoschedule { "test3" }
    start_time { "2023-12-12" }
    created_at { "2023-12-12" }
    updated_at { "2023-12-12" }
  end
end
