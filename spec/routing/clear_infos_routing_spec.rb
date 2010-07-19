require 'spec_helper'

describe ClearInfosController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/clear_infos" }.should route_to(:controller => "clear_infos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/clear_infos/new" }.should route_to(:controller => "clear_infos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/clear_infos/1" }.should route_to(:controller => "clear_infos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/clear_infos/1/edit" }.should route_to(:controller => "clear_infos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/clear_infos" }.should route_to(:controller => "clear_infos", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/clear_infos/1" }.should route_to(:controller => "clear_infos", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/clear_infos/1" }.should route_to(:controller => "clear_infos", :action => "destroy", :id => "1") 
    end
  end
end
