require 'spec_helper'

describe VipFeeInfosController do

  def mock_vip_fee_info(stubs={})
    @mock_vip_fee_info ||= mock_model(VipFeeInfo, stubs)
  end

  describe "GET index" do
    it "assigns all vip_fee_infos as @vip_fee_infos" do
      VipFeeInfo.stub(:find).with(:all).and_return([mock_vip_fee_info])
      get :index
      assigns[:vip_fee_infos].should == [mock_vip_fee_info]
    end
  end

  describe "GET show" do
    it "assigns the requested vip_fee_info as @vip_fee_info" do
      VipFeeInfo.stub(:find).with("37").and_return(mock_vip_fee_info)
      get :show, :id => "37"
      assigns[:vip_fee_info].should equal(mock_vip_fee_info)
    end
  end

  describe "GET new" do
    it "assigns a new vip_fee_info as @vip_fee_info" do
      VipFeeInfo.stub(:new).and_return(mock_vip_fee_info)
      get :new
      assigns[:vip_fee_info].should equal(mock_vip_fee_info)
    end
  end

  describe "GET edit" do
    it "assigns the requested vip_fee_info as @vip_fee_info" do
      VipFeeInfo.stub(:find).with("37").and_return(mock_vip_fee_info)
      get :edit, :id => "37"
      assigns[:vip_fee_info].should equal(mock_vip_fee_info)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created vip_fee_info as @vip_fee_info" do
        VipFeeInfo.stub(:new).with({'these' => 'params'}).and_return(mock_vip_fee_info(:save => true))
        post :create, :vip_fee_info => {:these => 'params'}
        assigns[:vip_fee_info].should equal(mock_vip_fee_info)
      end

      it "redirects to the created vip_fee_info" do
        VipFeeInfo.stub(:new).and_return(mock_vip_fee_info(:save => true))
        post :create, :vip_fee_info => {}
        response.should redirect_to(vip_fee_info_url(mock_vip_fee_info))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vip_fee_info as @vip_fee_info" do
        VipFeeInfo.stub(:new).with({'these' => 'params'}).and_return(mock_vip_fee_info(:save => false))
        post :create, :vip_fee_info => {:these => 'params'}
        assigns[:vip_fee_info].should equal(mock_vip_fee_info)
      end

      it "re-renders the 'new' template" do
        VipFeeInfo.stub(:new).and_return(mock_vip_fee_info(:save => false))
        post :create, :vip_fee_info => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested vip_fee_info" do
        VipFeeInfo.should_receive(:find).with("37").and_return(mock_vip_fee_info)
        mock_vip_fee_info.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :vip_fee_info => {:these => 'params'}
      end

      it "assigns the requested vip_fee_info as @vip_fee_info" do
        VipFeeInfo.stub(:find).and_return(mock_vip_fee_info(:update_attributes => true))
        put :update, :id => "1"
        assigns[:vip_fee_info].should equal(mock_vip_fee_info)
      end

      it "redirects to the vip_fee_info" do
        VipFeeInfo.stub(:find).and_return(mock_vip_fee_info(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(vip_fee_info_url(mock_vip_fee_info))
      end
    end

    describe "with invalid params" do
      it "updates the requested vip_fee_info" do
        VipFeeInfo.should_receive(:find).with("37").and_return(mock_vip_fee_info)
        mock_vip_fee_info.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :vip_fee_info => {:these => 'params'}
      end

      it "assigns the vip_fee_info as @vip_fee_info" do
        VipFeeInfo.stub(:find).and_return(mock_vip_fee_info(:update_attributes => false))
        put :update, :id => "1"
        assigns[:vip_fee_info].should equal(mock_vip_fee_info)
      end

      it "re-renders the 'edit' template" do
        VipFeeInfo.stub(:find).and_return(mock_vip_fee_info(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested vip_fee_info" do
      VipFeeInfo.should_receive(:find).with("37").and_return(mock_vip_fee_info)
      mock_vip_fee_info.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the vip_fee_infos list" do
      VipFeeInfo.stub(:find).and_return(mock_vip_fee_info(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(vip_fee_infos_url)
    end
  end

end
