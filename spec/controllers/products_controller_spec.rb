require 'rails_helper'

describe ProductsController, type: :controller do

  let(:product) {Product.create!(name: "examplename" ,description: "exampledescription", avgprice: 10.00, image_url: "950 card fp.png")}
  let(:user3)  {FactoryBot.create(:admin)}
  let(:product2) {Product.create!(name: "examplename" ,description: "exampledescription", avgprice: 10.00, image_url: "950 card fp.png")}

  describe 'GET #index' do
    it 'renders the products index template' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  describe 'GET#edit as an admin' do
    before do
      sign_in user3
    end
    it 'does allow access to the edit page for that product' do
      get :edit, params: {id: product.id}
      expect(response).to be_ok
    end
  end

  describe "DELETE as an admin" do
    before do
      sign_in user3
    end
    it 'deletes the product' do
      delete :destroy, params: {id: product2.id}
      expect(response).to redirect_to products_path
    end
  end


  describe 'GET #show' do
    it 'renders a specific product' do
      get :show, params: {id: product.id}
      expect(response).to be_ok
    end
  end


  describe 'Creating product with insufficient data' do
    it 'does not allow the product to be created - should raise an error' do
      expect(Product.new(description: "productwithnoname", avgprice: 10.00, image_url: "950 card fp.png")).not_to be_valid
    end
  end


  describe "PUT #update" do
    before do
      sign_in user3
    end
    it "destroys the product" do
      delete :destroy, params: {id: product.id}
      expect(response).to redirect_to products_path
    end
  end
end
