require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  before do
    @user = create(:admin)
    sign_in @user
  end

  describe "#index" do
    it "has 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "#approve" do
    before do
      @normal_user = create(:user)
    end
    it "approve user to be a admin" do
      post :approve, params: {id: @normal_user.id}
      expect(response.status).to eq(302)
      expect(@normal_user.has_role?(:admin)).to be_truthy
    end
  end

  describe "#disapprove" do
    before do
      @admin_user = create(:admin)
    end
    it "disapprove admin user" do
      post :disapprove, params: {id: @admin_user.id}
      expect(response.status).to eq(302)
      expect(@admin_user.has_role?(:admin)).to be_falsey
    end
  end

end
