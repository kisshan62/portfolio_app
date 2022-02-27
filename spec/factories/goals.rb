FactoryBot.define do
  factory :goal do
    name { "MyString" }
    description { "MyText" }
    user { :user }
  end
end