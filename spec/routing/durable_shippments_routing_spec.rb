require 'spec_helper'

describe DurableShippmentsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/durable_shippments" }.should route_to(:controller => "durable_shippments", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/durable_shippments/new" }.should route_to(:controller => "durable_shippments", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/durable_shippments/1" }.should route_to(:controller => "durable_shippments", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/durable_shippments/1/edit" }.should route_to(:controller => "durable_shippments", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/durable_shippments" }.should route_to(:controller => "durable_shippments", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/durable_shippments/1" }.should route_to(:controller => "durable_shippments", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/durable_shippments/1" }.should route_to(:controller => "durable_shippments", :action => "destroy", :id => "1") 
    end
  end
end
