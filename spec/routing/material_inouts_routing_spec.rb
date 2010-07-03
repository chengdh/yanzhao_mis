require 'spec_helper'

describe MaterialInoutsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/material_inouts" }.should route_to(:controller => "material_inouts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/material_inouts/new" }.should route_to(:controller => "material_inouts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/material_inouts/1" }.should route_to(:controller => "material_inouts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/material_inouts/1/edit" }.should route_to(:controller => "material_inouts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/material_inouts" }.should route_to(:controller => "material_inouts", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/material_inouts/1" }.should route_to(:controller => "material_inouts", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/material_inouts/1" }.should route_to(:controller => "material_inouts", :action => "destroy", :id => "1") 
    end
  end
end
