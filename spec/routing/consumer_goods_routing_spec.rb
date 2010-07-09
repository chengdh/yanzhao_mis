require 'spec_helper'

describe ConsumerGoodsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/consumer_goods" }.should route_to(:controller => "consumer_goods", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/consumer_goods/new" }.should route_to(:controller => "consumer_goods", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/consumer_goods/1" }.should route_to(:controller => "consumer_goods", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/consumer_goods/1/edit" }.should route_to(:controller => "consumer_goods", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/consumer_goods" }.should route_to(:controller => "consumer_goods", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/consumer_goods/1" }.should route_to(:controller => "consumer_goods", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/consumer_goods/1" }.should route_to(:controller => "consumer_goods", :action => "destroy", :id => "1") 
    end
  end
end
