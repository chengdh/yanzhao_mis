require 'spec_helper'

describe CarryingBillsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/carrying_bills" }.should route_to(:controller => "carrying_bills", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/carrying_bills/new" }.should route_to(:controller => "carrying_bills", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/carrying_bills/1" }.should route_to(:controller => "carrying_bills", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/carrying_bills/1/edit" }.should route_to(:controller => "carrying_bills", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/carrying_bills" }.should route_to(:controller => "carrying_bills", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/carrying_bills/1" }.should route_to(:controller => "carrying_bills", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/carrying_bills/1" }.should route_to(:controller => "carrying_bills", :action => "destroy", :id => "1") 
    end
  end
end
