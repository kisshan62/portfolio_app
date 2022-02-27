FactoryBot.define do
  factory :goal do
    title { "MyString" }
    description { "MyText" }
    association :user
  end
end