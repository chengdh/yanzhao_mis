require 'spec_helper'

describe VipConfigsController do

  def mock_vip_config(stubs={})
    @mock_vip_config ||= mock_model(VipConfig, stubs)
  end

  describe "GET index" do
    it "assigns all vip_configs as @vip_configs" do
      VipConfig.stub(:find).with(:all).and_return([mock_vip_config])
      get :index
      assigns[:vip_configs].should == [mock_vip_config]
    end
  end

  describe "GET show" do
    it "assigns the requested vip_config as @vip_config" do
      VipConfig.stub(:find).with("37").and_return(mock_vip_config)
      get :show, :id => "37"
      assigns[:vip_config].should equal(mock_vip_config)
    end
  end

  describe "GET new" do
    it "assigns a new vip_config as @vip_config" do
      VipConfig.stub(:new).and_return(mock_vip_config)
      get :new
      assigns[:vip_config].should equal(mock_vip_config)
    end
  end

  describe "GET edit" do
    it "assigns the requested vip_config as @vip_config" do
      VipConfig.stub(:find).with("37").and_return(mock_vip_config)
      get :edit, :id => "37"
      assigns[:vip_config].should equal(mock_vip_config)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created vip_config as @vip_config" do
        VipConfig.stub(:new).with({'these' => 'params'}).and_return(mock_vip_config(:save => true))
        post :create, :vip_config => {:these => 'params'}
        assigns[:vip_config].should equal(mock_vip_config)
      end

      it "redirects to the created vip_config" do
        VipConfig.stub(:new).and_return(mock_vip_config(:save => true))
        post :create, :vip_config => {}
        response.should redirect_to(vip_config_url(mock_vip_config))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vip_config as @vip_config" do
        VipConfig.stub(:new).with({'these' => 'params'}).and_return(mock_vip_config(:save => false))
        post :create, :vip_config => {:these => 'params'}
        assigns[:vip_config].should equal(mock_vip_config)
      end

      it "re-renders the 'new' template" do
        VipConfig.stub(:new).and_return(mock_vip_config(:save => false))
        post :create, :vip_config => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested vip_config" do
        VipConfig.should_receive(:find).with("37").and_return(mock_vip_config)
        mock_vip_config.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :vip_config => {:these => 'params'}
      end

      it "assigns the requested vip_config as @vip_config" do
        VipConfig.stub(:find).and_return(mock_vip_config(:update_attributes => true))
        put :update, :id => "1"
        assigns[:vip_config].should equal(mock_vip_config)
      end

      it "redirects to the vip_config" do
        VipConfig.stub(:find).and_return(mock_vip_config(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(vip_config_url(mock_vip_config))
      end
    end

    describe "with invalid params" do
      it "updates the requested vip_config" do
        VipConfig.should_receive(:find).with("37").and_return(mock_vip_config)
        mock_vip_config.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :vip_config => {:these => 'params'}
      end

      it "assigns the vip_config as @vip_config" do
        VipConfig.stub(:find).and_return(mock_vip_config(:update_attributes => false))
        put :update, :id => "1"
        assigns[:vip_config].should equal(mock_vip_config)
      end

      it "re-renders the 'edit' template" do
        VipConfig.stub(:find).and_return(mock_vip_config(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested vip_config" do
      VipConfig.should_receive(:find).with("37").and_return(mock_vip_config)
      mock_vip_config.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the vip_configs list" do
      VipConfig.stub(:find).and_return(mock_vip_config(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(vip_configs_url)
    end
  end

end
