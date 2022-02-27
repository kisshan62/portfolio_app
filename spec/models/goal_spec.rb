require 'rails_helper'

RSpec.describe Goal, type: :model do
  before do
    @goal = FactoryBot.create(:goal)
  end

  it "is valid with a title, description" do
    expect(@goal).to be_valid
  end

  
  it "is invalid without title" do
    goal = FactoryBot.build(:goal, title: nil)
    goal.invalid?
    expect(goal.errors[:title]).to include("can't be blank")
  end

  it "is invalid without description" do
    goal = FactoryBot.build(:goal, description: nil)
    goal.invalid?
    expect(goal.errors[:description]).to include("can't be blank")
  end
end
