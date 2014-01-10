require 'spec_helper'
require 'support/omniauth_macros'

feature 'authenticate with github', %q{
  As an user,
  I want to log in using my Github Account
  So that I can have access to admin functionality
}, authentication: true,
vcr: {cassette_name: 'github/auth'} do

  # Acceptance Criteria
  # * Admins are authenticated via Github API
  # * If authentication fails, returns to the root path and flashes an error message

  describe 'successful authentication' do
    it "Login button should log in" do
      visit root_path
      click_link "Log in"
      
      page.should have_link "Logout"
    end
  end

end

    