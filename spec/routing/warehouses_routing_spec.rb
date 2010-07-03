require 'spec_helper'

describe WarehousesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/warehouses" }.should route_to(:controller => "warehouses", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/warehouses/new" }.should route_to(:controller => "warehouses", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/warehouses/1" }.should route_to(:controller => "warehouses", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/warehouses/1/edit" }.should route_to(:controller => "warehouses", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/warehouses" }.should route_to(:controller => "warehouses", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/warehouses/1" }.should route_to(:controller => "warehouses", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/warehouses/1" }.should route_to(:controller => "warehouses", :action => "destroy", :id => "1") 
    end
  end
end
