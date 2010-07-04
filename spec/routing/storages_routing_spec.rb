require 'spec_helper'

describe StoragesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/storages" }.should route_to(:controller => "storages", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/storages/new" }.should route_to(:controller => "storages", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/storages/1" }.should route_to(:controller => "storages", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/storages/1/edit" }.should route_to(:controller => "storages", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/storages" }.should route_to(:controller => "storages", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/storages/1" }.should route_to(:controller => "storages", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/storages/1" }.should route_to(:controller => "storages", :action => "destroy", :id => "1") 
    end
  end
end
