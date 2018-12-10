require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#upgrade_primium" do
    before do
      @user = create(:user)
      sign_in @user
    end
    it "has 302 status code" do
      post :upgrade_primium, params: {id: @user.id}
      expect(response.status).to eq(302)
      expect(@user.has_role?(:premium)).to be_truthy
    end
  end
end
