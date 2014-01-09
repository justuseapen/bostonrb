require 'spec_helper'

feature 'Admin creates a new event' do
  scenario 'with only project night level access' do
    pending 'level of admin not defined'
  end

  scenario 'with valid information' do
    visit new_event_path

    select('Meeting', from: 'Select Event Type')
    select('Brightcove', from: 'Select Location')
    fill_in 'Date', with: 'February 11, 2014'
    fill_in 'Start at', with: '6:45PM'
    fill_in 'End at', with: '6:45PM'
    fill_in 'RSVP url', with: 'www.eventbrite.com'
    click_on 'Create event'

    expect(page).to have_content('Event successfully created')
  end

  scenario 'with invalid information' do
    visit new_event_path

    click_on 'Create event'

    expect(page).to have_content('Invalid information. Please try again')
  end
end
