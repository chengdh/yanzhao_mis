require 'spec_helper'

describe "/contracts/index.html.erb" do
  include ContractsHelper

  before(:each) do
    assigns[:contracts] = [
      stub_model(Contract,
        :org => stub_model(Org,:name => "org"),
        :radio_start => 9.99,
        :radio_back => 9.98,
        :note => "value for note"
      ),
      stub_model(Contract,
        :org => stub_model(Org,:name => "org"),
        :radio_start => 9.99,
        :radio_back => 9.98,
        :note => "value for note"
      )
    ]
  end

  it "renders a list of contracts" do
    render
  end
end
