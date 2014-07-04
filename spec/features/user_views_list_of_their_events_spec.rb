# require 'rails_helper'

# feature 'User views list of their events', %Q{
#   As a authenticated user
#   I want to be able to see all the events that I created and
#   that I am a part of
#   So that I can keep track of my events and participate in other
#   events
# } do

#   context 'authenticated user' do
#     before :each do
#       @user = FactoryGirl.create(:user)
#       login(@user)
#       @events = FactoryGirl.create_list(:event, 3)
#       visit events_path
#     end

#     scenario 'user views all of their events' do
#     end
#   end
# end
