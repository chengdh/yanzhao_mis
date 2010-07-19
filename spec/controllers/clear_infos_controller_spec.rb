require 'spec_helper'

describe ClearInfosController do

  def mock_clear_info(stubs={})
    @mock_clear_info ||= mock_model(ClearInfo, stubs)
  end

  describe "GET index" do
    it "assigns all clear_infos as @clear_infos" do
      ClearInfo.stub(:find).with(:all).and_return([mock_clear_info])
      get :index
      assigns[:clear_infos].should == [mock_clear_info]
    end
  end

  describe "GET show" do
    it "assigns the requested clear_info as @clear_info" do
      ClearInfo.stub(:find).with("37").and_return(mock_clear_info)
      get :show, :id => "37"
      assigns[:clear_info].should equal(mock_clear_info)
    end
  end

  describe "GET new" do
    it "assigns a new clear_info as @clear_info" do
      ClearInfo.stub(:new).and_return(mock_clear_info)
      get :new
      assigns[:clear_info].should equal(mock_clear_info)
    end
  end

  describe "GET edit" do
    it "assigns the requested clear_info as @clear_info" do
      ClearInfo.stub(:find).with("37").and_return(mock_clear_info)
      get :edit, :id => "37"
      assigns[:clear_info].should equal(mock_clear_info)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created clear_info as @clear_info" do
        ClearInfo.stub(:new).with({'these' => 'params'}).and_return(mock_clear_info(:save => true))
        post :create, :clear_info => {:these => 'params'}
        assigns[:clear_info].should equal(mock_clear_info)
      end

      it "redirects to the created clear_info" do
        ClearInfo.stub(:new).and_return(mock_clear_info(:save => true))
        post :create, :clear_info => {}
        response.should redirect_to(clear_info_url(mock_clear_info))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved clear_info as @clear_info" do
        ClearInfo.stub(:new).with({'these' => 'params'}).and_return(mock_clear_info(:save => false))
        post :create, :clear_info => {:these => 'params'}
        assigns[:clear_info].should equal(mock_clear_info)
      end

      it "re-renders the 'new' template" do
        ClearInfo.stub(:new).and_return(mock_clear_info(:save => false))
        post :create, :clear_info => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested clear_info" do
        ClearInfo.should_receive(:find).with("37").and_return(mock_clear_info)
        mock_clear_info.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :clear_info => {:these => 'params'}
      end

      it "assigns the requested clear_info as @clear_info" do
        ClearInfo.stub(:find).and_return(mock_clear_info(:update_attributes => true))
        put :update, :id => "1"
        assigns[:clear_info].should equal(mock_clear_info)
      end

      it "redirects to the clear_info" do
        ClearInfo.stub(:find).and_return(mock_clear_info(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(clear_info_url(mock_clear_info))
      end
    end

    describe "with invalid params" do
      it "updates the requested clear_info" do
        ClearInfo.should_receive(:find).with("37").and_return(mock_clear_info)
        mock_clear_info.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :clear_info => {:these => 'params'}
      end

      it "assigns the clear_info as @clear_info" do
        ClearInfo.stub(:find).and_return(mock_clear_info(:update_attributes => false))
        put :update, :id => "1"
        assigns[:clear_info].should equal(mock_clear_info)
      end

      it "re-renders the 'edit' template" do
        ClearInfo.stub(:find).and_return(mock_clear_info(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested clear_info" do
      ClearInfo.should_receive(:find).with("37").and_return(mock_clear_info)
      mock_clear_info.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the clear_infos list" do
      ClearInfo.stub(:find).and_return(mock_clear_info(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(clear_infos_url)
    end
  end

end
