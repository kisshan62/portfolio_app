# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  email: "guest@example.com",
  username: "guestuser",
  created_at: Time.now,
  updated_at: Time.now,
  confirmed_at: Time.now,
  password: "aaaaaa"
)

5.times do |n|
  User.create!(
    email: "test#{n + 1}@test.com",
    username: "username#{n + 1}",
    created_at: Time.now,
    updated_at: Time.now,
    confirmed_at: Time.now,
    password: "aaaaaa"
  )
end

3.times do |n|
  User.all.each do |user|
    user.goals.create!(
      title: "#{user.username}'s NO.#{n} title",
      description: " #{user.username}'s No.#{n} description"
    )
  end
end

3.times do |n|
  User.all.each do |user|
    user.goals.create!(
      title: "#{user.username}'s title without start_day",
      description: " #{user.username}'s No.#{n} description without start_day"
    )
  end
end
3.times do |n|
  User.all.each do |user|
    user.goals.create!(
      title: "#{user.username}'s title without due_day",
      description: " #{user.username}'s No.#{n} description without due_day"
    )
  end
end

User.all.each do |user|
  user.goals.each do |goal|
    goal.comments.create!(
      user_id: goal.user_id,
      content: "#{goal.user.username} comment"
    )
  end
end