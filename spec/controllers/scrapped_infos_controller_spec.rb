require 'spec_helper'

describe ScrappedInfosController do

  def mock_scrapped_info(stubs={})
    @mock_scrapped_info ||= mock_model(ScrappedInfo, stubs)
  end

  describe "GET index" do
    it "assigns all scrapped_infos as @scrapped_infos" do
      ScrappedInfo.stub(:find).with(:all).and_return([mock_scrapped_info])
      get :index
      assigns[:scrapped_infos].should == [mock_scrapped_info]
    end
  end

  describe "GET show" do
    it "assigns the requested scrapped_info as @scrapped_info" do
      ScrappedInfo.stub(:find).with("37").and_return(mock_scrapped_info)
      get :show, :id => "37"
      assigns[:scrapped_info].should equal(mock_scrapped_info)
    end
  end

  describe "GET new" do
    it "assigns a new scrapped_info as @scrapped_info" do
      ScrappedInfo.stub(:new).and_return(mock_scrapped_info)
      get :new
      assigns[:scrapped_info].should equal(mock_scrapped_info)
    end
  end

  describe "GET edit" do
    it "assigns the requested scrapped_info as @scrapped_info" do
      ScrappedInfo.stub(:find).with("37").and_return(mock_scrapped_info)
      get :edit, :id => "37"
      assigns[:scrapped_info].should equal(mock_scrapped_info)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created scrapped_info as @scrapped_info" do
        ScrappedInfo.stub(:new).with({'these' => 'params'}).and_return(mock_scrapped_info(:save => true))
        post :create, :scrapped_info => {:these => 'params'}
        assigns[:scrapped_info].should equal(mock_scrapped_info)
      end

      it "redirects to the created scrapped_info" do
        ScrappedInfo.stub(:new).and_return(mock_scrapped_info(:save => true))
        post :create, :scrapped_info => {}
        response.should redirect_to(scrapped_info_url(mock_scrapped_info))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved scrapped_info as @scrapped_info" do
        ScrappedInfo.stub(:new).with({'these' => 'params'}).and_return(mock_scrapped_info(:save => false))
        post :create, :scrapped_info => {:these => 'params'}
        assigns[:scrapped_info].should equal(mock_scrapped_info)
      end

      it "re-renders the 'new' template" do
        ScrappedInfo.stub(:new).and_return(mock_scrapped_info(:save => false))
        post :create, :scrapped_info => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested scrapped_info" do
        ScrappedInfo.should_receive(:find).with("37").and_return(mock_scrapped_info)
        mock_scrapped_info.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :scrapped_info => {:these => 'params'}
      end

      it "assigns the requested scrapped_info as @scrapped_info" do
        ScrappedInfo.stub(:find).and_return(mock_scrapped_info(:update_attributes => true))
        put :update, :id => "1"
        assigns[:scrapped_info].should equal(mock_scrapped_info)
      end

      it "redirects to the scrapped_info" do
        ScrappedInfo.stub(:find).and_return(mock_scrapped_info(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(scrapped_info_url(mock_scrapped_info))
      end
    end

    describe "with invalid params" do
      it "updates the requested scrapped_info" do
        ScrappedInfo.should_receive(:find).with("37").and_return(mock_scrapped_info)
        mock_scrapped_info.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :scrapped_info => {:these => 'params'}
      end

      it "assigns the scrapped_info as @scrapped_info" do
        ScrappedInfo.stub(:find).and_return(mock_scrapped_info(:update_attributes => false))
        put :update, :id => "1"
        assigns[:scrapped_info].should equal(mock_scrapped_info)
      end

      it "re-renders the 'edit' template" do
        ScrappedInfo.stub(:find).and_return(mock_scrapped_info(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested scrapped_info" do
      ScrappedInfo.should_receive(:find).with("37").and_return(mock_scrapped_info)
      mock_scrapped_info.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the scrapped_infos list" do
      ScrappedInfo.stub(:find).and_return(mock_scrapped_info(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(scrapped_infos_url)
    end
  end

end
