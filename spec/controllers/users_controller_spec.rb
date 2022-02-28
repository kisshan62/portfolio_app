require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do

    before do
      @user = FactoryBot.create(:user)
    end

    it "returns http success" do
      sign_in @user
      get user_path(@user)
      expect(response).to be_successful
    end
    
    it "user have 5 goals"
      
    end

end
