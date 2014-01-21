require 'spec_helper'

class Client
  def initialize(access_t)
  end

  def org_member?(one, two)
    true
  end

  def team_member?(one, two)
    true
  end

  def user
    def login
      'bob'
    end
  end
end

# describe '#new' do
#   context "no params passed" do
#     @clientclient_class.new
#     it 'has no client' do
#       @
#     end
#   end
#   context ''

# end


describe '#is_member?' do
  fake_params = {
  'credentials' => {'token'=> 'yay'}
}
  test = GithubAuth.new(fake_params, Client)
  expect(test.is_member?).to be_true
end

describe '#assign_team' do

end

