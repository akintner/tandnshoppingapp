require 'rails_helper'

RSpec.feature do
  before do
    @product1 = Product.create(name: "Twin Mattress", cost: 325.0)
    @product2 = Product.create(name: "King Mattress", cost: 700.0)
  end
  
  context 'cart page' do
    context 'visitor' do
      scenario 'can add items to cart without issue' do
        visit products_path

        click_button('Add To Cart', match: :first)

        expect(page).to have_content 'You now have 1 order of Twin Mattress in your cart.'
        
        click_link 'View your current cart'

        expect(page).to have_link 'Log in or Register to Check out'
        expect(page).to have_content 'Twin Mattress'      
        expect(page).to have_content 'Quantity in cart: 1'
        expect(page).to have_content 'Subtotal: $325.00'

        click_link 'Back to All Products'
        
        click_button('Add To Cart', match: :first)
        
        expect(page).to have_content 'You now have 2 orders of Twin Mattress in your cart.'
      end
    end
  end
end