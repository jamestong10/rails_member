require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  before do
    @user = create(:admin)
    sign_in @user
  end

  describe "#index" do
    before do
      get :index
    end
    it "return 200 status code" do
      expect(response.status).to eq(200)
    end
    it "should render index view" do
      expect(response).to render_template(:index)
    end
    it "should have the same product count" do
      expect(User.all.count).to eq(assigns(:users).count)
    end
  end

  describe "#approve" do
    before do
      @normal_user = create(:user)
      post :approve, params: {id: @normal_user.id}
    end
    it "retrun 302 status code" do
      expect(response.status).to eq(302)
    end
    it "approve user to be a admin" do
      expect(@normal_user.has_role?(:admin)).to be_truthy
    end
    it "should redirect admin_users_path" do
      expect(response).to redirect_to(admin_users_path)
    end
  end

  describe "#disapprove" do
    before do
      @admin_user = create(:admin)
      post :disapprove, params: {id: @admin_user.id}
    end
    it "retrun 302 status code" do
      expect(response.status).to eq(302)
    end
    it "should not have admin role" do
      expect(@admin_user.has_role?(:admin)).to be_falsey
    end
    it "should redirect admin_users_path" do
      expect(response).to redirect_to(admin_users_path)
    end
  end

end
