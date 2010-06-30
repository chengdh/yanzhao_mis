require 'spec_helper'

describe AddressBooksController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/address_books" }.should route_to(:controller => "address_books", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/address_books/new" }.should route_to(:controller => "address_books", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/address_books/1" }.should route_to(:controller => "address_books", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/address_books/1/edit" }.should route_to(:controller => "address_books", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/address_books" }.should route_to(:controller => "address_books", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/address_books/1" }.should route_to(:controller => "address_books", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/address_books/1" }.should route_to(:controller => "address_books", :action => "destroy", :id => "1") 
    end
  end
end
