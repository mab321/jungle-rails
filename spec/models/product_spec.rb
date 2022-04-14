require 'rails_helper'

RSpec.describe Product, type: :model do
    describe 'Validations' do
      # validation tests/examples here

      it 'Test product name is nil' do
        @category= Category.new(name: 'Furniture')
        @product = Product.new(name: nil, price: 150, quantity: 4, category: @category)

        @product.save 
        
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it 'Test product name is nil' do
        @category= Category.new(name: 'Furniture')
        @product = Product.new(name: 'nightstand', price: nil, quantity: 4, category: @category)

        @product.save 
        
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it 'Test product name is nil' do
        @category= Category.new(name: 'Furniture')
        @product = Product.new(name: 'black sofa', price: 150, quantity: nil, category: @category)

        @product.save 
        
        expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end

      it 'Test product name is nil' do
        @category= Category.new(name: 'Furniture')
        @product = Product.new(name: 'couch', price: 150, quantity: 4, category: nil)

        @product.save 
        
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it 'Test product name is nil' do
        @category= Category.new(name: 'Furniture')
        @product = Product.new(name: 'lounge chair', price: 500, quantity: 4, category: @category)

        @product.save 
        
        expect(@product).to be_valid
      end
    
  end
  
end