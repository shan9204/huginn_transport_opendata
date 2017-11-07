require 'rails_helper'
require 'huginn_agent/spec_helper'

describe Agents::TransportOpendata do
  before(:each) do
    @valid_options = Agents::TransportOpendata.new.default_options
    @checker = Agents::TransportOpendata.new(:name => "TransportOpendata", :options => @valid_options)
    @checker.user = users(:bob)
    @checker.save!
  end

  pending "add specs here"
end
