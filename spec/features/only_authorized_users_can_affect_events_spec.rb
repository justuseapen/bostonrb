require 'spec_helper'
require 'support/omniauth_macros'

feature 'authorized by github', %q{
  As a User,
  I want to access certain permissions based on my Github team authorization,
  So that I can edit events I am responsible for
}, authentication: true,
vcr: {cassette_name: 'github/auth'} do

   # * Administrators can perform CRUD actions on any event
   # * Project Night Collaborators can perform CRUD actions on only project night events
   # * If Project Night Collaborators attempt to edit a non-project night event, they are given an error message

  scenario 'unauthorized user attempts to make event' do
    visit new_event_path
    click_button 'Create Event'
    expect(page).to have_content'Please sign in'
  end
  scenario 'unauthorized user attempts to edit event' do
    event = FactoryGirl.create(:event)
    visit event_path(event)
    expect(page).to have_content('Please sign in')
  end
  scenario 'user gets authorized and makes event' do
    visit root_path
    click_link "Log in"
    click_link "Add Event"
  end
end
    


