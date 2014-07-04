require 'rails_helper'

feature 'User signs in', %Q{
  As a authenticated user
  I want to sign in
  So that I can continue to my profile page
} do

  scenario 'specifies valid and required information' do
    user = FactoryGirl.create(:user)

    visit root_path

    click_link 'sign in'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign in'

    expect(page).to have_content('sign out')
    expect(page).to_not have_content('sign in')
  end

  scenario 'fails to enter required information' do
    visit root_path

    click_link 'sign in'

    fill_in 'Email', with: ''
    fill_in 'Password', with: ''

    click_button 'Sign in'

    expect(page).to have_content('Invalid email or password')
  end

  scenario 'fails to provide valid information' do
    visit root_path

    click_link 'sign in'

    fill_in 'Email', with: 'foobar@example.com'
    fill_in 'Password', with: 'failingpassword'

    click_button 'Sign in'

    expect(page).to have_content('Invalid email or password')
  end
end
