require 'spec_helper'

describe "/contracts/show.html.erb" do
  include ContractsHelper
  before(:each) do
    assigns[:contract] = @contract = stub_model(Contract,
      :org => stub_model(Org,{}),
      :radio_start => 9.99,
      :radio_back => 9.99,
      :note => "value for note"
    )
  end

  it "renders attributes in <p>" do
    render
  end
end
