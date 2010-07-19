require 'spec_helper'

describe TkInfosController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/tk_infos" }.should route_to(:controller => "tk_infos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/tk_infos/new" }.should route_to(:controller => "tk_infos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/tk_infos/1" }.should route_to(:controller => "tk_infos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/tk_infos/1/edit" }.should route_to(:controller => "tk_infos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/tk_infos" }.should route_to(:controller => "tk_infos", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/tk_infos/1" }.should route_to(:controller => "tk_infos", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/tk_infos/1" }.should route_to(:controller => "tk_infos", :action => "destroy", :id => "1") 
    end
  end
end
