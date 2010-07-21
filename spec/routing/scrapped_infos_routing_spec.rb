require 'spec_helper'

describe ScrappedInfosController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/scrapped_infos" }.should route_to(:controller => "scrapped_infos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/scrapped_infos/new" }.should route_to(:controller => "scrapped_infos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/scrapped_infos/1" }.should route_to(:controller => "scrapped_infos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/scrapped_infos/1/edit" }.should route_to(:controller => "scrapped_infos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/scrapped_infos" }.should route_to(:controller => "scrapped_infos", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/scrapped_infos/1" }.should route_to(:controller => "scrapped_infos", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/scrapped_infos/1" }.should route_to(:controller => "scrapped_infos", :action => "destroy", :id => "1") 
    end
  end
end
