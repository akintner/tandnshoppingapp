require 'rails_helper'

RSpec.feature do
  before do
    @user = User.create(username: "Prof. Snape",
                      email: "grumpyawesome@hogwarts.edu", 
                      password: "sectumsempra", 
                      role: 1)
  end
  
  context 'visit admin dashboard' do
    context 'admin' do
      scenario 'see dashboard link' do
        login_user(@user)
        expect(page).to have_content 'See Customer Experience Rep Dashboard'
      end

      scenario 'see a link to view all items' do
        login_user(@user)        
        visit admin_dashboard_path

        expect(page).to have_content 'Admin and Customer Experience Representative Dashboard'        
        expect(page).to have_content 'All Orders'
      end
    end
  end
end