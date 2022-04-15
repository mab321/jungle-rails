require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature do
  
   # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
      
    end
  end

  scenario "increment cart count when adding item to cart" do
    # ACT
    visit root_path

    #check before adding item
    expect(page).to have_content 'My Cart (0)'
    
    
    #add item
    page.first('.product').click_button('Add')

    #check cart items number after adding an item
    expect(page).to have_content 'My Cart (1)'
  end

end
