require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a email, username, and password" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "is invalid without email" do
    user = FactoryBot.build(:user, email: nil)
    user.invalid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without username" do
  #   user = User.new(username: nil)
  #   user.invalid?
  #   expect(user.errors[:username]).to include("can't be blank")
  end
  
  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "tester@example.com")
    other_user = FactoryBot.build(:user, email: "tester@example.com")
    other_user.valid?
    expect(other_user.errors[:email]).to include("has already been taken")
  end
end
