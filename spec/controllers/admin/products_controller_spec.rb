require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
  let(:product) { create(:product) }
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
  
  describe "#show" do
    it "has 200 status code" do
      get :show, params: { use_route: 'admin/products/', id: product.id }
      expect(response.status).to eq(200)
    end
  end

  describe "#new" do
    it "has 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end
  end
  
  describe "#edit" do
    it "has 200 status code" do
      get :edit, params: {id: product.id}
      expect(response.status).to eq(200)
    end
  end
  
  describe "#create" do
    before(:all) do
      @product_params = attributes_for(:product)
    end
    it "successful create and redirect" do
      post :create, params: {product: @product_params}
      expect(response.status).to eq(302)
    end
  end
  
  describe "#update" do
    before(:all) do
      @product_params = attributes_for(:product)
    end
    it "successful update and redirect" do
      post :update, params: {use_route: 'admin/products/', product: @product_params, id: product.id}
      expect(response.status).to eq(302)
    end
  end
  
  describe "#destroy" do
    it "successful delete and redirect" do
      delete :destroy, params: {id: product.id}
      expect(response.status).to eq(302)
    end
  end

end

