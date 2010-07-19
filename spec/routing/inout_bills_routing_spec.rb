require 'spec_helper'

describe InoutBillsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/inout_bills" }.should route_to(:controller => "inout_bills", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/inout_bills/new" }.should route_to(:controller => "inout_bills", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/inout_bills/1" }.should route_to(:controller => "inout_bills", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/inout_bills/1/edit" }.should route_to(:controller => "inout_bills", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/inout_bills" }.should route_to(:controller => "inout_bills", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/inout_bills/1" }.should route_to(:controller => "inout_bills", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/inout_bills/1" }.should route_to(:controller => "inout_bills", :action => "destroy", :id => "1") 
    end
  end
end
