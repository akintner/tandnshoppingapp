require 'rails_helper'

RSpec.feature do
  before do
    @product1 = Product.create(name: "Twin Mattress", cost: 325.0)
    @product2 = Product.create(name: "King Mattress", cost: 700.0)
  end
  
  context 'visit products page' do
    context 'visitor' do
      scenario 'see all products' do
        visit products_path

        expect(page).to have_content 'THE INTERNET’S MOST COMFORTABLE MATTRESS'
        expect(page).to have_link 'Twin Mattress'
        expect(page).to have_content '$700.00'
      end

      scenario 'can add items to cart and register to checkout' do
        visit products_path

        click_button('Add To Cart', match: :first)

        expect(page).to have_content 'You now have 1 order of Twin Mattress in your cart.'
        
        click_link 'View your current cart'

        expect(page).to have_link 'Log in or Register to Check out'

        click_link 'Log in or Register to Check out'
        click_link 'Create Account'
        fill_account_info
        click_on 'Create User'

        expect(page).to have_content 'Logged in as Captain Picard'        
      end
    end
  end
end