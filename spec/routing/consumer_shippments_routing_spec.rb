require 'spec_helper'

describe ConsumerShippmentsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/consumer_shippments" }.should route_to(:controller => "consumer_shippments", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/consumer_shippments/new" }.should route_to(:controller => "consumer_shippments", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/consumer_shippments/1" }.should route_to(:controller => "consumer_shippments", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/consumer_shippments/1/edit" }.should route_to(:controller => "consumer_shippments", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/consumer_shippments" }.should route_to(:controller => "consumer_shippments", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/consumer_shippments/1" }.should route_to(:controller => "consumer_shippments", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/consumer_shippments/1" }.should route_to(:controller => "consumer_shippments", :action => "destroy", :id => "1") 
    end
  end
end
