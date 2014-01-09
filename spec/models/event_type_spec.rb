require 'spec_helper'

describe EventType do
  it { should validate_presence_of :name }
end
