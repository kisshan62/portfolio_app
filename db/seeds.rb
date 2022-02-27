# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  email: "guest@example.com",
  created_at: Time.now,
  updated_at: Time.now,
  confirmed_at: Time.now,
  password: "aaaaaa"
)

5.times do |n|
  User.create!(
    email: "test#{n + 1}@test.com",
    created_at: Time.now,
    updated_at: Time.now,
    confirmed_at: Time.now,
    password: "aaaaaa"
  )
end

User.all.each do |user|
  user.goals.create!(
    title: 'タイトル',
    description: 'テキストテキストテキストテキスト'
  )
end