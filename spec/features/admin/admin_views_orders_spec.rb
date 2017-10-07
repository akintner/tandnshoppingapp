require 'rails_helper'

RSpec.feature do
  before do
    @user = User.create(username: "Prof. Snape",
                      email: "grumpyawesome@hogwarts.edu", 
                      password: "sectumsempra", 
                      role: 1)
    @user1 = User.create(username: "Draco Malfoy",
                      email: "bestblood@rich.com",
                      password: "filthymuggles",
                      role: 0)
    @product1 = Product.create(name: "Twin Mattress", cost: 325.0)
    @product2 = Product.create(name: "King Mattress", cost: 700.0)
    @order = Order.create(user_id: @user1.id, channel: 0)
    @order1 = Order.create(user_id: @user1.id, channel:2)
    @line_item = LineItem.create(product_id: @product1.id, quantity: 2, order_id: @order.id, current_price_per_unit: 325.0)
    @line_item1 =  LineItem.create(product_id: @product2.id, quantity: 3, order_id: @order1.id, current_price_per_unit: 700.0)
  end
  
  context 'visit admin dashboard' do
    context 'admin' do
      scenario 'see dashboard link' do
        login_user(@user)
        click_link 'See Customer Experience Rep Dashboard'

        expect(page).to have_content 'Filter by Sales Channel'        
        expect(page).to have_content 'Draco Malfoy'        
        expect(page).to have_content "Order ID: #{@order.id}"        
        expect(page).to have_content "Total: #{@order.amount}"
        expect(page).to have_content "Sales Channel: online"        
        expect(page).to have_content "Sales Channel: retail" 
        expect(page).to have_content "Order ID: #{@order1.id}"        
        expect(page).to have_content "Total: #{@order1.amount}"           
      end
    end
  end
end