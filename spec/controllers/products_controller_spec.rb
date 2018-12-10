require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  let(:product) { create(:product) }

  describe "#index" do
    it "has 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end
  
  describe "#show" do
    it "has 200 status code" do
      get :show , params: { use_route: 'products/', id: product.id }
      expect(response.status).to eq(200)
    end
  end
  
end
