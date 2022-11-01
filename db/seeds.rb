# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  email: "guest@example.com",
  username: "ゲストユーザ",
  profile: "ゲストユーザのプロフィール",
  created_at: Time.now,
  updated_at: Time.now,
  confirmed_at: Time.now,
  password: "aaaaaa"
)

User.find_by(username: "ゲストユーザ").goals.create!(
  title: "転職を成功させる",
  description: "web系企業への転職を成功させる",
  start_date: Time.now,
  due_date: Time.now.since(3.month)
)

Goal.find_by(id: 1).steps.create!(
  title: "rubyに入門する",
  description: "プロを目指す人のためのRuby入門を読破する",
  start_date: Time.now.ago(2.month),
  due_date: Time.now.ago(1.month)
)

Goal.find_by(id: 1).steps.create!(
  title: "ポートフォリオ作成",
  description: "webアプリを作成する",
  start_date: Time.now,
  due_date: Time.now.since(1.month)
)

Goal.find_by(id: 1).steps.create!(
  title: "プログラミングスキル向上",
  description: "100問プログラミング問題を解く",
  start_date: Time.now,
  due_date: Time.now.since(1.month),
  done:true
)

User.find_by(username: "ゲストユーザ").goals.create!(
  title: "禁煙する",
  description: "禁煙外来に受診する",
  start_date: Time.now,
  due_date: Time.now.since(3.month)
)

5.times do |n|
  User.create!(
    email: "test#{n + 1}@test.com",
    username: "ユーザ#{n + 1}",
    profile: "ユーザ#{n + 1}のプロフィール",
    created_at: Time.now,
    updated_at: Time.now,
    confirmed_at: Time.now,
    password: "aaaaaa"
  )
end

User.find_by(id:2).goals.create!(
  title: "東京大学合格",
  description: "東京大学文化一類合格！"
)

Goal.find_by(id: 3).steps.create!(
  title: "東大模試でC判定",
  description: "毎日10時間勉強"
)

User.find_by(id: 3).goals.create!(
  title: "恋人を作る！",
  description: "マッチングアプリの活用、婚活パーティ、街コンへの参加を並行して行う。"
)

# ユーザ1がゲストユーザをフォロー
Relationship.create!(
  follower_id: 1,
  following_id: 2
)

# ゲストユーザがユーザ1をフォロー
Relationship.create!(
  follower_id: 2,
  following_id: 1
)

# ユーザ1がゲストユーザの投稿にコメント投稿
User.find_by(username: "ユーザ1").comments.create!(
  content: "応援しています。ぜひ転職成功させてください！",
  goal_id: 1
)
# 3.times do |n|
#   User.where('username like ?','username') do |user|
#     user.goals.create!(
#       title: "#{user.username}'s NO.#{n} title",
#       description: " #{user.username}'s No.#{n} description"
#     )
#   end
# end

# 3.times do |n|
#   User.where('username like ?','username') do |user|
#     user.goals.create!(
#       title: "#{user.username}'s title without start_day",
#       description: " #{user.username}'s No.#{n} description without start_day"
#     )
#   end
# end

# User.all.each do |user|
#   user.goals.each do |goal|
#     goal.comments.create!(
#       user_id: goal.user_id,
#       content: "#{goal.user.username} comment"
#     )
#   end
# end