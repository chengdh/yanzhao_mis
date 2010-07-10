require 'spec_helper'

describe VipInfosController do

  def mock_vip_info(stubs={})
    @mock_vip_info ||= mock_model(VipInfo, stubs)
  end

  describe "GET index" do
    it "assigns all vip_infos as @vip_infos" do
      VipInfo.stub(:find).with(:all).and_return([mock_vip_info])
      get :index
      assigns[:vip_infos].should == [mock_vip_info]
    end
  end

  describe "GET show" do
    it "assigns the requested vip_info as @vip_info" do
      VipInfo.stub(:find).with("37").and_return(mock_vip_info)
      get :show, :id => "37"
      assigns[:vip_info].should equal(mock_vip_info)
    end
  end

  describe "GET new" do
    it "assigns a new vip_info as @vip_info" do
      VipInfo.stub(:new).and_return(mock_vip_info)
      get :new
      assigns[:vip_info].should equal(mock_vip_info)
    end
  end

  describe "GET edit" do
    it "assigns the requested vip_info as @vip_info" do
      VipInfo.stub(:find).with("37").and_return(mock_vip_info)
      get :edit, :id => "37"
      assigns[:vip_info].should equal(mock_vip_info)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created vip_info as @vip_info" do
        VipInfo.stub(:new).with({'these' => 'params'}).and_return(mock_vip_info(:save => true))
        post :create, :vip_info => {:these => 'params'}
        assigns[:vip_info].should equal(mock_vip_info)
      end

      it "redirects to the created vip_info" do
        VipInfo.stub(:new).and_return(mock_vip_info(:save => true))
        post :create, :vip_info => {}
        response.should redirect_to(vip_info_url(mock_vip_info))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vip_info as @vip_info" do
        VipInfo.stub(:new).with({'these' => 'params'}).and_return(mock_vip_info(:save => false))
        post :create, :vip_info => {:these => 'params'}
        assigns[:vip_info].should equal(mock_vip_info)
      end

      it "re-renders the 'new' template" do
        VipInfo.stub(:new).and_return(mock_vip_info(:save => false))
        post :create, :vip_info => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested vip_info" do
        VipInfo.should_receive(:find).with("37").and_return(mock_vip_info)
        mock_vip_info.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :vip_info => {:these => 'params'}
      end

      it "assigns the requested vip_info as @vip_info" do
        VipInfo.stub(:find).and_return(mock_vip_info(:update_attributes => true))
        put :update, :id => "1"
        assigns[:vip_info].should equal(mock_vip_info)
      end

      it "redirects to the vip_info" do
        VipInfo.stub(:find).and_return(mock_vip_info(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(vip_info_url(mock_vip_info))
      end
    end

    describe "with invalid params" do
      it "updates the requested vip_info" do
        VipInfo.should_receive(:find).with("37").and_return(mock_vip_info)
        mock_vip_info.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :vip_info => {:these => 'params'}
      end

      it "assigns the vip_info as @vip_info" do
        VipInfo.stub(:find).and_return(mock_vip_info(:update_attributes => false))
        put :update, :id => "1"
        assigns[:vip_info].should equal(mock_vip_info)
      end

      it "re-renders the 'edit' template" do
        VipInfo.stub(:find).and_return(mock_vip_info(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested vip_info" do
      VipInfo.should_receive(:find).with("37").and_return(mock_vip_info)
      mock_vip_info.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the vip_infos list" do
      VipInfo.stub(:find).and_return(mock_vip_info(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(vip_infos_url)
    end
  end

end
