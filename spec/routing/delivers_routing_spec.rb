require 'spec_helper'

describe DeliversController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/delivers" }.should route_to(:controller => "delivers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/delivers/new" }.should route_to(:controller => "delivers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/delivers/1" }.should route_to(:controller => "delivers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/delivers/1/edit" }.should route_to(:controller => "delivers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/delivers" }.should route_to(:controller => "delivers", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/delivers/1" }.should route_to(:controller => "delivers", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/delivers/1" }.should route_to(:controller => "delivers", :action => "destroy", :id => "1") 
    end
  end
end
