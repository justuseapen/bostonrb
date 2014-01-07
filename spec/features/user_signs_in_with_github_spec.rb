require 'spec_helper'
require 'requests/spec_helper'

describe "user authenticates through github" do
  it "can sign in user with github account" do
    visit '/'
    page.should have_content("Sign in with Github")
    mock_auth_hash
    click_link "Sign in"
    page.should have_content("mockuser")  # user name
    page.should have_content("Sign out")
  end
 
  it "can handle authentication error" do
    OmniAuth.config.mock_auth[:github] = :invalid_credentials
    visit '/'
    page.should have_content("Sign in with Github")
    click_link "Sign in"
    page.should have_content('Authentication failed.')
  end
 
end