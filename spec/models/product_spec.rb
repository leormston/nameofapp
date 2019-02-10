require 'rails_helper'

describe Product do
  context "Calculate average rating" do
    let(:product) { Product.create!(name: "Test GPU") }
    let(:user) { User.create!(email: "Test123@test.com", password: "password")}
    before do
      product.comments.create!(rating: 1, user: user, body: "Awful GPU")
      product.comments.create!(rating: 3, user: user, body: "Medium rare GPU")
      product.comments.create!(rating: 5, user: user, body: "WOW!")
    end


    it "returns average rating of all comments" do
      expect(product.comments.average(:rating)).to eq 3
    end
  end

  context "Testing validation of new product with no name" do

    it "Raises an exception stating that a name is required" do
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end
  end

end
