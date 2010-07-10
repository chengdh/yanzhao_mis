require 'spec_helper'

describe VipConfigsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/vip_configs" }.should route_to(:controller => "vip_configs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/vip_configs/new" }.should route_to(:controller => "vip_configs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/vip_configs/1" }.should route_to(:controller => "vip_configs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/vip_configs/1/edit" }.should route_to(:controller => "vip_configs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/vip_configs" }.should route_to(:controller => "vip_configs", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/vip_configs/1" }.should route_to(:controller => "vip_configs", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/vip_configs/1" }.should route_to(:controller => "vip_configs", :action => "destroy", :id => "1") 
    end
  end
end
