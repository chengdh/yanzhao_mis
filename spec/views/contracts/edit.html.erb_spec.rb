require 'spec_helper'

describe "/contracts/edit.html.erb" do
  include ContractsHelper

  before(:each) do
    assigns[:contract] = @contract = stub_model(Contract,
      :new_record? => false,
      :org => 1,
      :radio_start => 9.99,
      :radio_back => 9.99,
      :note => "value for note"
    )
  end

  it "renders the edit contract form" do
    render

    response.should have_tag("form[action=#{contract_path(@contract)}][method=post]") do
      with_tag('input#contract_org[name=?]', "contract[org]")
      with_tag('input#contract_radio_start[name=?]', "contract[radio_start]")
      with_tag('input#contract_radio_back[name=?]', "contract[radio_back]")
      with_tag('input#contract_note[name=?]', "contract[note]")
    end
  end
end
