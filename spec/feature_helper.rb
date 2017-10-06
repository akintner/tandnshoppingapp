module FeatureHelpers

  def login_user(user)
    visit login_path
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Login'
  end

  def fill_account_info
    fill_in 'username', with: 'Captain Picard'
    fill_in 'email', with: 'dotheyhaveemailinthe24thcentury?@startrek.org'
    fill_in 'password', with: 'makeitso'
  end

  def login_stub(user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
end  