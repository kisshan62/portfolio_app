FactoryBot.define do
  factory :comment do
    content { "MyString" }
    user { nil }
    goal { "" }
  end
end
