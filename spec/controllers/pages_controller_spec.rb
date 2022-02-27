require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #index" do

    before do
      @user = FactoryBot.create(:user)
    end

    it "returns http success" do
      sign_in @user
      get :index
      expect(response).to be_successful
    end
    
    it "user have 5 goals"
    end
  end
end
