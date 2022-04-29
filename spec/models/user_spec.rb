require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validation test" do
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
      user = FactoryBot.build(:user, username: nil)
      user.invalid?
      expect(user.errors[:username]).to include("can't be blank")
    end
    
    # 重複したメールアドレスなら無効な状態であること
    it "is invalid with a duplicate email address" do
      FactoryBot.create(:user, email: "tester@example.com")
      other_user = FactoryBot.build(:user, email: "tester@example.com")
      other_user.valid?
      expect(other_user.errors[:email]).to include("has already been taken")
    end

    # 重複したユーザ名なら無効な状態であること
    it "is invalid with a duplicate username" do
      FactoryBot.create(:user, username: "user1")
      other_user = FactoryBot.build(:user, username: "user1")
      other_user.valid?
      expect(other_user.errors[:username]).to include("has already been taken")
    end
  end

  describe "search test" do
    before do
      @user1 = FactoryBot.create(:user, username: "useraaa1")
      @user2 = FactoryBot.create(:user, username: "userbbb2")
      @user3 = FactoryBot.create(:user, username: "userccc3")
      @user4 = FactoryBot.create(:user, username: "useraaa4")
    end
    context "or search" do
      it "include 3 users" do
        expect(User.search("aaa bbb ccc","or_match")).to include(@user1, @user2, @user3)
      end
      it "include 2 users" do
        expect(User.search("aaa bbb","or_match")).to include(@user1, @user2)
      end
      it "include 1 user" do
        expect(User.search("aaa","or_match")).to include(@user1)
      end
    end

    context "and search" do
      it "two words" do
        expect(User.search("user aaa","and_match")).to include(@user1,@user4)
      end
    end
  end

end
