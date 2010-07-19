require 'spec_helper'

describe TkInfosController do

  def mock_tk_info(stubs={})
    @mock_tk_info ||= mock_model(TkInfo, stubs)
  end

  describe "GET index" do
    it "assigns all tk_infos as @tk_infos" do
      TkInfo.stub(:find).with(:all).and_return([mock_tk_info])
      get :index
      assigns[:tk_infos].should == [mock_tk_info]
    end
  end

  describe "GET show" do
    it "assigns the requested tk_info as @tk_info" do
      TkInfo.stub(:find).with("37").and_return(mock_tk_info)
      get :show, :id => "37"
      assigns[:tk_info].should equal(mock_tk_info)
    end
  end

  describe "GET new" do
    it "assigns a new tk_info as @tk_info" do
      TkInfo.stub(:new).and_return(mock_tk_info)
      get :new
      assigns[:tk_info].should equal(mock_tk_info)
    end
  end

  describe "GET edit" do
    it "assigns the requested tk_info as @tk_info" do
      TkInfo.stub(:find).with("37").and_return(mock_tk_info)
      get :edit, :id => "37"
      assigns[:tk_info].should equal(mock_tk_info)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created tk_info as @tk_info" do
        TkInfo.stub(:new).with({'these' => 'params'}).and_return(mock_tk_info(:save => true))
        post :create, :tk_info => {:these => 'params'}
        assigns[:tk_info].should equal(mock_tk_info)
      end

      it "redirects to the created tk_info" do
        TkInfo.stub(:new).and_return(mock_tk_info(:save => true))
        post :create, :tk_info => {}
        response.should redirect_to(tk_info_url(mock_tk_info))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved tk_info as @tk_info" do
        TkInfo.stub(:new).with({'these' => 'params'}).and_return(mock_tk_info(:save => false))
        post :create, :tk_info => {:these => 'params'}
        assigns[:tk_info].should equal(mock_tk_info)
      end

      it "re-renders the 'new' template" do
        TkInfo.stub(:new).and_return(mock_tk_info(:save => false))
        post :create, :tk_info => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested tk_info" do
        TkInfo.should_receive(:find).with("37").and_return(mock_tk_info)
        mock_tk_info.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tk_info => {:these => 'params'}
      end

      it "assigns the requested tk_info as @tk_info" do
        TkInfo.stub(:find).and_return(mock_tk_info(:update_attributes => true))
        put :update, :id => "1"
        assigns[:tk_info].should equal(mock_tk_info)
      end

      it "redirects to the tk_info" do
        TkInfo.stub(:find).and_return(mock_tk_info(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(tk_info_url(mock_tk_info))
      end
    end

    describe "with invalid params" do
      it "updates the requested tk_info" do
        TkInfo.should_receive(:find).with("37").and_return(mock_tk_info)
        mock_tk_info.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :tk_info => {:these => 'params'}
      end

      it "assigns the tk_info as @tk_info" do
        TkInfo.stub(:find).and_return(mock_tk_info(:update_attributes => false))
        put :update, :id => "1"
        assigns[:tk_info].should equal(mock_tk_info)
      end

      it "re-renders the 'edit' template" do
        TkInfo.stub(:find).and_return(mock_tk_info(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested tk_info" do
      TkInfo.should_receive(:find).with("37").and_return(mock_tk_info)
      mock_tk_info.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the tk_infos list" do
      TkInfo.stub(:find).and_return(mock_tk_info(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(tk_infos_url)
    end
  end

end
