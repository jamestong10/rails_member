require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
  describe "#index" do
    it "user does not login" do
      get :index
      expect(flash[:notice]).to eq("Please Login")
      expect(response.status).to eq(302)
      expect(response).to redirect_to(root_path)
    end
    
    it "user does not have admin role" do
      @user = create(:user)
      sign_in @user
      get :index
      expect(flash[:notice]).to eq("You are not a admin")
      expect(response.status).to eq(302)
      expect(response).to redirect_to(root_path)
    end
  end
end