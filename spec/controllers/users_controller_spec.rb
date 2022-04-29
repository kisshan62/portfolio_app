require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #show" do
    before do
      @user = FactoryBot.create(:user)
    end

    context "as an authenticated user" do
      it "returns http success" do
        sign_in @user
        get :show, params: { id: @user.id }
        expect(response).to be_successful
      end
    end

    context "as a guest" do
      it "returns a 302 response" do
        get :show, params: { id: @user.id }
        expect(response).to have_http_status 302
      end

      it "redirect to the root_path" do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to "/users/sign_in"
      end

    end
  end
end
