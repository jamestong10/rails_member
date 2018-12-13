require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
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
      get :show, params: { use_route: 'products/', id: @product.id }
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
end
