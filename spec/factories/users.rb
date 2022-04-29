FactoryBot.define do
  factory :user do
    sequence(:id) { |n| "#{n}" }
    sequence(:username) { |n| "test_user_#{n}" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    sequence(:profile) { |n| "profile_#{n}"}
    password { "dottle-nouveau-pavilion-tights-furze" }
    confirmed_at { Time.now }
    created_at  { Time.now }
    updated_at  { Time.now }
  end
end