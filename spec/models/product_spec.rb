require 'rails_helper'

RSpec.describe Product, type: :model do
  before :all do
    @category = Category.new(name: 'testing-category')
  end

  describe 'Validations' do
    # validation tests/examples here

    it 'should successfully save' do
      @product = Product.new
      @product.name = 'testingname'
      @product.price = 1234
      @product.quantity = 2
      @product.category = @category
      expect(@product.save).to be true
    end

    it 'should have a price' do
      @product = Product.new
      @product.name = 'testingname'
      @product.quantity = 2
      @product.category = @category
      expect(@product.save).to be false
    end

    it 'should have a name' do
      @product = Product.new
      @product.price = 1234
      @product.quantity = 2
      @product.category = @category
      expect(@product.save).to be false
    end

    it 'should have a quantity' do
      @product = Product.new
      @product.name = 'testingname'
      @product.price = 1234
      @product.category = @category
      expect(@product.save).to be false
    end

    it 'should have a category' do
      @product = Product.new
      @product.name = 'testingname'
      @product.price = 1234
      @product.quantity = 2
      expect(@product.save).to be false
    end



  end
end