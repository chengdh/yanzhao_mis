require 'spec_helper'

describe "/address_books/show.html.erb" do
  include AddressBooksHelper
  before(:each) do
    assigns[:address_book] = @address_book = stub_model(AddressBook,
      :org => 1,
      :user => 1,
      :is_active => false
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/false/)
  end
end
