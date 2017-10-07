require 'rails_helper'

RSpec.feature do
  before do
    @user = User.create(username: "Dumbledore",
                      email: "master@hogwarts.edu", 
                      password: "", 
                      role: 1)
    @user1 = User.create(username: "Draco Malfoy",
                        email: "",
                        password: "filthymuggles",
                        role: 0)
  end
  
  context 'user cant log in without proper details' do
    scenario 'no password' do
      login_user(@user)
      expect(page).to have_content 'Name or password incorrect'
    end

    scenario 'wrong email' do
      login_user(@user1)        

      expect(page).to have_content 'Name or password incorrect'        
    end
  end
end