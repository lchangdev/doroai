require 'rails_helper'

feature 'user signs up', %Q{
  As an unauthenticated user
  I want to sign up
  So that I can create events and view other events.
} do

  scenario 'specifying valid and required information' do
    user = FactoryGirl.build(:user)

    visit root_path

    click_link 'sign up'

    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password
    click_button 'Sign Up'

    expect(page).to have_content('sign out')
    expect(page).to_not have_content('sign in')
  end

  scenario 'required information is not supplied' do
    user = FactoryGirl.build(:user)

    visit root_path
    click_link 'sign up'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
  end

  scenario 'password confirmation does not match confirmation' do
    user = FactoryGirl.build(:user)

    visit root_path
    click_link 'sign up'
    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: 'notmatchingpassword'
    click_button 'Sign Up'

    expect(page).to have_content("confirmation doesn't match")
  end
end
