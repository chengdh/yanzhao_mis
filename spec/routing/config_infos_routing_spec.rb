require 'spec_helper'

describe ConfigInfosController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/config_infos" }.should route_to(:controller => "config_infos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/config_infos/new" }.should route_to(:controller => "config_infos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/config_infos/1" }.should route_to(:controller => "config_infos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/config_infos/1/edit" }.should route_to(:controller => "config_infos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/config_infos" }.should route_to(:controller => "config_infos", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/config_infos/1" }.should route_to(:controller => "config_infos", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/config_infos/1" }.should route_to(:controller => "config_infos", :action => "destroy", :id => "1") 
    end
  end
end
