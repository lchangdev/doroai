module LoginHelper
  def login(user)
    visit root_path
    click_on 'sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
  end
end
