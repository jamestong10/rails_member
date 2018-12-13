require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do
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
      expect(Product.all.count).to eq(assigns(:products).count)
    end
  end
  
  describe "#show" do
    before do
      @product = create(:product)
      get :show, params: { use_route: 'admin/products/', id: @product.id }
    end
    it "return 200 status code" do
      expect(response.status).to eq(200)
    end
    it "should render show view" do
      expect(response).to render_template(:show)
    end
    it "should have same product id" do
      expect(@product.id).to eq(assigns(:product).id)
    end
  end

  describe "#new" do
    before do
      get :new
    end
    it "return 200 status code" do
      expect(response.status).to eq(200)
    end
    it "should render new view" do
      expect(response).to render_template(:new)
    end
  end
  
  describe "#edit" do
    before do
      @product = create(:product)
      get :edit, params: {id: @product.id}
    end
    it "return 200 status code" do
      expect(response.status).to eq(200)
    end
    it "should render edit view" do
      expect(response).to render_template(:edit)
    end
  end
  
  describe "#create" do
    before do
      @product_params = attributes_for(:product)
      post :create, params: {product: @product_params}
    end
    it "should successful create product" do
      expect(assigns(:product)).to be_a(Product)
    end
    it "return 302 status code" do
      expect(response.status).to eq(302)
    end
    it "should redirect admin_products_path" do
      expect(response).to redirect_to(admin_products_path)
    end
  end
  
  describe "#update" do
    before do
      @edit_product = create(:product)
      @product_params = attributes_for(:product)
      post :update, params: {use_route: 'admin/products/', product: @product_params, id: @edit_product.id}
    end
    it "should updated success" do
      expect(assigns(:product).id).to eq(@edit_product.id)
    end
    it "return 302 status code" do
      expect(response.status).to eq(302)
    end
    it "successful update and redirect" do
      expect(response.status).to eq(302)
    end
    it "should redirect admin_products_path" do
      expect(response).to redirect_to(admin_products_path)
    end
  end
  
  describe "#destroy" do
    before do
      @product = create(:product)
      delete :destroy, params: {id: @product.id}
    end
    it "should destory success" do
      expect {Product.find(@product.id)}.to raise_exception(ActiveRecord::RecordNotFound)
    end
    it "return 302 status code" do
      expect(response.status).to eq(302)
    end
    it "should redirect admin_products_path" do
      expect(response).to redirect_to(admin_products_path)
    end
  end

end

