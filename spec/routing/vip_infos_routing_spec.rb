require 'spec_helper'

describe VipInfosController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/vip_infos" }.should route_to(:controller => "vip_infos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/vip_infos/new" }.should route_to(:controller => "vip_infos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/vip_infos/1" }.should route_to(:controller => "vip_infos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/vip_infos/1/edit" }.should route_to(:controller => "vip_infos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/vip_infos" }.should route_to(:controller => "vip_infos", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/vip_infos/1" }.should route_to(:controller => "vip_infos", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/vip_infos/1" }.should route_to(:controller => "vip_infos", :action => "destroy", :id => "1") 
    end
  end
end
