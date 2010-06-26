require 'spec_helper'

describe SubCompaniesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/sub_companies" }.should route_to(:controller => "sub_companies", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/sub_companies/new" }.should route_to(:controller => "sub_companies", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/sub_companies/1" }.should route_to(:controller => "sub_companies", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/sub_companies/1/edit" }.should route_to(:controller => "sub_companies", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/sub_companies" }.should route_to(:controller => "sub_companies", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/sub_companies/1" }.should route_to(:controller => "sub_companies", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/sub_companies/1" }.should route_to(:controller => "sub_companies", :action => "destroy", :id => "1") 
    end
  end
end
