require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  before do
    user = User.new(email: 'admin@example.com', password: '12341234')
    user.add_role(:admin)
    user.save!
    sign_in user
  end

  describe "#index" do
    it "has 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "#approve" do
    before do
      @fake_user = User.new(email: "rspec1@example.com", password: '12341234')
      @fake_user.save!
    end
    it "approve user to be a admin" do
      post :approve, params: {id: @fake_user.id}
      expect(response.status).to eq(302)
      expect(@fake_user.has_role?(:admin)).to be_truthy
    end
  end

  describe "#disapprove" do
    before do
      @fake_user = User.new(email: "rspec2@example.com", password: '12341234')
      @fake_user.save!
      @fake_user.add_role(:admin)
    end
    it "disapprove admin user" do
      post :disapprove, params: {id: @fake_user.id}
      expect(response.status).to eq(302)
      expect(@fake_user.has_role?(:admin)).to be_falsey
    end
  end

end
