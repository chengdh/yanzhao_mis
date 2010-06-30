require 'spec_helper'

describe "/address_books/edit.html.erb" do
  include AddressBooksHelper

  before(:each) do
    assigns[:address_book] = @address_book = stub_model(AddressBook,
      :new_record? => false,
      :org => 1,
      :user => 1,
      :is_active => false
    )
  end

  it "renders the edit address_book form" do
    render

    response.should have_tag("form[action=#{address_book_path(@address_book)}][method=post]") do
      with_tag('input#address_book_org[name=?]', "address_book[org]")
      with_tag('input#address_book_user[name=?]', "address_book[user]")
      with_tag('input#address_book_is_active[name=?]', "address_book[is_active]")
    end
  end
end
