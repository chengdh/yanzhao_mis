require 'spec_helper'

describe "/address_books/index.html.erb" do
  include AddressBooksHelper

  before(:each) do
    assigns[:address_books] = [
      stub_model(AddressBook,
        :org => 1,
        :user => 1,
        :is_active => false
      ),
      stub_model(AddressBook,
        :org => 1,
        :user => 1,
        :is_active => false
      )
    ]
  end

  it "renders a list of address_books" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end
