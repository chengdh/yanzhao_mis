require 'spec_helper'

describe ConfirmsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/confirms" }.should route_to(:controller => "confirms", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/confirms/new" }.should route_to(:controller => "confirms", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/confirms/1" }.should route_to(:controller => "confirms", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/confirms/1/edit" }.should route_to(:controller => "confirms", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/confirms" }.should route_to(:controller => "confirms", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/confirms/1" }.should route_to(:controller => "confirms", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/confirms/1" }.should route_to(:controller => "confirms", :action => "destroy", :id => "1") 
    end
  end
end
