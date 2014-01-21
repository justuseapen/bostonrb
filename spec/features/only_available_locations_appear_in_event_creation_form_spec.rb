require 'spec_helper'

feature 'Admin creates new event' do
  scenario 'deleted location does not exist' do
    location = Location.create(name: 'Mission Control', street: "33 Harrison", city: "Boston", state: "Massachusetts", zipcode: '02125', time_of_deletion: Time.now)
    Location.create(name: 'false Control', street: "33 Harrison", city: "Boston", state: "Massachusetts", zipcode: '02125')

    visit new_event_path
    find_field('Location').should_not have_content('Mission Control')
  end
end
