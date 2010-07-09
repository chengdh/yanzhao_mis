require 'spec_helper'

describe DurableReceiptsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/durable_receipts" }.should route_to(:controller => "durable_receipts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/durable_receipts/new" }.should route_to(:controller => "durable_receipts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/durable_receipts/1" }.should route_to(:controller => "durable_receipts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/durable_receipts/1/edit" }.should route_to(:controller => "durable_receipts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/durable_receipts" }.should route_to(:controller => "durable_receipts", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/durable_receipts/1" }.should route_to(:controller => "durable_receipts", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/durable_receipts/1" }.should route_to(:controller => "durable_receipts", :action => "destroy", :id => "1") 
    end
  end
end
