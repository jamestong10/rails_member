require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
  describe "#index" do
    it "user doest not login" do
      get :index
      expect(flash[:notice]).to eq("Please Login")
      expect(response.status).to eq(302)
    end
  end

  describe "#index" do
    before do
      @user = create(:user)
      sign_in @user
    end

    it "user has not admin role" do
      get :index
      expect(flash[:notice]).to eq("You are not a admin")
      expect(response.status).to eq(302)
    end
  end
end