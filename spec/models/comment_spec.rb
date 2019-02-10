require 'rails_helper'

describe Comment do
  let(:user4)  {FactoryBot.create(:user)}
  let(:product) {Product.create!(name: "examplename" ,description: "exampledescription", avgprice: 10.00, image_url: "950 card fp.png")}
  describe 'Adding a comment' do

    context 'with no body' do
      it "should reject comment" do
        expect(Comment.new(rating: 3, user: user4, body: nil, product_id: product.id)).not_to be_valid
      end
    end


    context 'with no rating' do
      it "should reject comment" do
        expect(Comment.new(user: user4, body: "examplebody", rating: nil, product_id: product.id)).not_to be_valid
      end
    end


    context 'not logged in' do
      it "should reject comment" do
        expect(Comment.new(body: "examplebody", rating: 5, product_id: product.id)).not_to be_valid
      end
    end

    context 'with all valid parameters' do
      it 'should upload the comment to the database' do
        expect(Comment.new(body: "examplebody", rating: 5, user: user4, product_id: product.id)).to be_valid
      end
    end

    context 'with no product id' do
      it 'should not upload the comment to the database' do
        expect(Comment.new(body: "examplebody", rating: 5, user: user4)).to_not be_valid
      end
    end
  end

  describe 'Deleting a Comment' do

    context 'when logged in' do
      it "should no longer exist" do
        newComment = Comment.new(body: "examplebody", rating: 5, user: user4, product_id: product.id)
        expect(newComment.delete).to be_valid
      end

    end
  end
end
