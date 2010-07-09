require 'spec_helper'

describe DurableGoodsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/durable_goods" }.should route_to(:controller => "durable_goods", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/durable_goods/new" }.should route_to(:controller => "durable_goods", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/durable_goods/1" }.should route_to(:controller => "durable_goods", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/durable_goods/1/edit" }.should route_to(:controller => "durable_goods", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/durable_goods" }.should route_to(:controller => "durable_goods", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/durable_goods/1" }.should route_to(:controller => "durable_goods", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/durable_goods/1" }.should route_to(:controller => "durable_goods", :action => "destroy", :id => "1") 
    end
  end
end
