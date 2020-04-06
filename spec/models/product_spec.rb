require 'rails_helper'


RSpec.describe Product, type: :model do
    describe 'Validations' do
      before do
        @product = Product.new({
          name: "Random Name",
          price: 2032,
          quantity: 3,
          category: Category.new
        })
      end
      # validation tests/examples here
      it "should validate :name, presence: true" do
        @product.name = nil
        expect(@product).to_not be_valid
        @product.name = "Random Name"
        expect(@product).to be_valid
      end

      it "should validate :price, presence: true" do
        @product.price_cents = nil
        expect(@product).to_not be_valid
        @product.price_cents = 2034
        expect(@product).to be_valid
      end

      it "should validate :quantity, presence: true" do
        @product.quantity = nil
        expect(@product).to_not be_valid
        @product.quantity = 3
        expect(@product).to be_valid
      end

      it "should validate :category, presence: true" do
        @product.category = nil
        expect(@product).to_not be_valid
        @product.category = Category.new
        expect(@product).to be_valid
      end
    end
  end

  # @product.error.messages