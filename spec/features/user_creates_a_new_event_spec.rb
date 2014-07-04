require 'rails_helper'

feature 'User creates a new event.', %Q{
  As a authenticated user
  I want to be able to create a new event
  so that I can share the gifts I really want with
  my friends and family.
} do

  context 'authenticated user' do
    before :each do
      @user = FactoryGirl.create(:user)
      login(@user)
    end

    scenario 'User creates a new event' do
      event = FactoryGirl.create(:event)

      visit new_event_path

      fill_in 'Name', with: event.name
      fill_in 'Description', with: event.description

      click_on 'Create Event'

      expect(page).to have_content('Success.')
      expect(page).to have_content(event.name)
      expect(page).to have_content(event.description)
      expect(page).to have_content(event.event_date)
    end

    scenario 'User enters incomplete event information' do
      visit new_event_path

      click_on 'Create Event'

      expect(page).to_not have_content('Success')
      expect(page).to have_content("can't be blank")
    end
  end
end
