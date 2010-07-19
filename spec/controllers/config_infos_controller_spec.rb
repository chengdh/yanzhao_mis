require 'spec_helper'

describe ConfigInfosController do

  def mock_config_info(stubs={})
    @mock_config_info ||= mock_model(ConfigInfo, stubs)
  end

  describe "GET index" do
    it "assigns all config_infos as @config_infos" do
      ConfigInfo.stub(:find).with(:all).and_return([mock_config_info])
      get :index
      assigns[:config_infos].should == [mock_config_info]
    end
  end

  describe "GET show" do
    it "assigns the requested config_info as @config_info" do
      ConfigInfo.stub(:find).with("37").and_return(mock_config_info)
      get :show, :id => "37"
      assigns[:config_info].should equal(mock_config_info)
    end
  end

  describe "GET new" do
    it "assigns a new config_info as @config_info" do
      ConfigInfo.stub(:new).and_return(mock_config_info)
      get :new
      assigns[:config_info].should equal(mock_config_info)
    end
  end

  describe "GET edit" do
    it "assigns the requested config_info as @config_info" do
      ConfigInfo.stub(:find).with("37").and_return(mock_config_info)
      get :edit, :id => "37"
      assigns[:config_info].should equal(mock_config_info)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created config_info as @config_info" do
        ConfigInfo.stub(:new).with({'these' => 'params'}).and_return(mock_config_info(:save => true))
        post :create, :config_info => {:these => 'params'}
        assigns[:config_info].should equal(mock_config_info)
      end

      it "redirects to the created config_info" do
        ConfigInfo.stub(:new).and_return(mock_config_info(:save => true))
        post :create, :config_info => {}
        response.should redirect_to(config_info_url(mock_config_info))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved config_info as @config_info" do
        ConfigInfo.stub(:new).with({'these' => 'params'}).and_return(mock_config_info(:save => false))
        post :create, :config_info => {:these => 'params'}
        assigns[:config_info].should equal(mock_config_info)
      end

      it "re-renders the 'new' template" do
        ConfigInfo.stub(:new).and_return(mock_config_info(:save => false))
        post :create, :config_info => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested config_info" do
        ConfigInfo.should_receive(:find).with("37").and_return(mock_config_info)
        mock_config_info.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :config_info => {:these => 'params'}
      end

      it "assigns the requested config_info as @config_info" do
        ConfigInfo.stub(:find).and_return(mock_config_info(:update_attributes => true))
        put :update, :id => "1"
        assigns[:config_info].should equal(mock_config_info)
      end

      it "redirects to the config_info" do
        ConfigInfo.stub(:find).and_return(mock_config_info(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(config_info_url(mock_config_info))
      end
    end

    describe "with invalid params" do
      it "updates the requested config_info" do
        ConfigInfo.should_receive(:find).with("37").and_return(mock_config_info)
        mock_config_info.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :config_info => {:these => 'params'}
      end

      it "assigns the config_info as @config_info" do
        ConfigInfo.stub(:find).and_return(mock_config_info(:update_attributes => false))
        put :update, :id => "1"
        assigns[:config_info].should equal(mock_config_info)
      end

      it "re-renders the 'edit' template" do
        ConfigInfo.stub(:find).and_return(mock_config_info(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested config_info" do
      ConfigInfo.should_receive(:find).with("37").and_return(mock_config_info)
      mock_config_info.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the config_infos list" do
      ConfigInfo.stub(:find).and_return(mock_config_info(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(config_infos_url)
    end
  end

end
