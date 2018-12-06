require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  let(:product) {
    Product.create(name: Faker::Name.name, quantity: rand(100..1000), price: rand(100.1000))
  }

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
