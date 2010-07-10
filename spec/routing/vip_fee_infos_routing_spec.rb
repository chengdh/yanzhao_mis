require 'spec_helper'

describe VipFeeInfosController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/vip_fee_infos" }.should route_to(:controller => "vip_fee_infos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/vip_fee_infos/new" }.should route_to(:controller => "vip_fee_infos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/vip_fee_infos/1" }.should route_to(:controller => "vip_fee_infos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/vip_fee_infos/1/edit" }.should route_to(:controller => "vip_fee_infos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/vip_fee_infos" }.should route_to(:controller => "vip_fee_infos", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/vip_fee_infos/1" }.should route_to(:controller => "vip_fee_infos", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/vip_fee_infos/1" }.should route_to(:controller => "vip_fee_infos", :action => "destroy", :id => "1") 
    end
  end
end
