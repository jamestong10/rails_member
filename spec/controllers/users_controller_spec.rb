require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "#upgrade_premium" do
    before do
      @user = create(:user)
      sign_in @user
    end

    it "should flash notice when upgrade other user" do
      @other_user = create(:user)
      post :upgrade_premium, params: {id: @other_user.id}
      expect(flash[:notice]).to eq("You can not upgrade to premium.")
      expect(response.status).to eq(302)
      expect(response).to redirect_to(root_path)
    end
    
    it "return 302 status code" do
      post :upgrade_premium, params: {id: @user.id}
      expect(@user.has_role?(:premium)).to be_truthy
      expect(response.status).to eq(302)
      expect(response).to redirect_to(root_path)
    end
  end
end
