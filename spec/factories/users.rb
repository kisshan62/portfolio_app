FactoryBot.define do
  factory :user do
    sequence(:id) { |n| "#{n}" }
    sequence(:username) { |n| "test_user_#{n}" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "dottle-nouveau-pavilion-tights-furze" }
    confirmed_at { Time.now }
  end
end
