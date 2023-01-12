FactoryBot.define do
  factory :diary do
    association :user
    when_diary { "2023-01-01" }
    created_at { "2023-01-01" }
    updated_at { "2023-01-01" }
    title { "test4" }
    whodiary { "test5" }
    body { "test6" }
  end
end
