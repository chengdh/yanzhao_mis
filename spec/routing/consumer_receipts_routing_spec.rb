require 'spec_helper'

describe ConsumerReceiptsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/consumer_receipts" }.should route_to(:controller => "consumer_receipts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/consumer_receipts/new" }.should route_to(:controller => "consumer_receipts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/consumer_receipts/1" }.should route_to(:controller => "consumer_receipts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/consumer_receipts/1/edit" }.should route_to(:controller => "consumer_receipts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/consumer_receipts" }.should route_to(:controller => "consumer_receipts", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/consumer_receipts/1" }.should route_to(:controller => "consumer_receipts", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/consumer_receipts/1" }.should route_to(:controller => "consumer_receipts", :action => "destroy", :id => "1") 
    end
  end
end
