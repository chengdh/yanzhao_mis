require 'spec_helper'

describe PostInfosController do

  def mock_post_info(stubs={})
    @mock_post_info ||= mock_model(PostInfo, stubs)
  end

  describe "GET index" do
    it "assigns all post_infos as @post_infos" do
      PostInfo.stub(:find).with(:all).and_return([mock_post_info])
      get :index
      assigns[:post_infos].should == [mock_post_info]
    end
  end

  describe "GET show" do
    it "assigns the requested post_info as @post_info" do
      PostInfo.stub(:find).with("37").and_return(mock_post_info)
      get :show, :id => "37"
      assigns[:post_info].should equal(mock_post_info)
    end
  end

  describe "GET new" do
    it "assigns a new post_info as @post_info" do
      PostInfo.stub(:new).and_return(mock_post_info)
      get :new
      assigns[:post_info].should equal(mock_post_info)
    end
  end

  describe "GET edit" do
    it "assigns the requested post_info as @post_info" do
      PostInfo.stub(:find).with("37").and_return(mock_post_info)
      get :edit, :id => "37"
      assigns[:post_info].should equal(mock_post_info)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created post_info as @post_info" do
        PostInfo.stub(:new).with({'these' => 'params'}).and_return(mock_post_info(:save => true))
        post :create, :post_info => {:these => 'params'}
        assigns[:post_info].should equal(mock_post_info)
      end

      it "redirects to the created post_info" do
        PostInfo.stub(:new).and_return(mock_post_info(:save => true))
        post :create, :post_info => {}
        response.should redirect_to(post_info_url(mock_post_info))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post_info as @post_info" do
        PostInfo.stub(:new).with({'these' => 'params'}).and_return(mock_post_info(:save => false))
        post :create, :post_info => {:these => 'params'}
        assigns[:post_info].should equal(mock_post_info)
      end

      it "re-renders the 'new' template" do
        PostInfo.stub(:new).and_return(mock_post_info(:save => false))
        post :create, :post_info => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested post_info" do
        PostInfo.should_receive(:find).with("37").and_return(mock_post_info)
        mock_post_info.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :post_info => {:these => 'params'}
      end

      it "assigns the requested post_info as @post_info" do
        PostInfo.stub(:find).and_return(mock_post_info(:update_attributes => true))
        put :update, :id => "1"
        assigns[:post_info].should equal(mock_post_info)
      end

      it "redirects to the post_info" do
        PostInfo.stub(:find).and_return(mock_post_info(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(post_info_url(mock_post_info))
      end
    end

    describe "with invalid params" do
      it "updates the requested post_info" do
        PostInfo.should_receive(:find).with("37").and_return(mock_post_info)
        mock_post_info.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :post_info => {:these => 'params'}
      end

      it "assigns the post_info as @post_info" do
        PostInfo.stub(:find).and_return(mock_post_info(:update_attributes => false))
        put :update, :id => "1"
        assigns[:post_info].should equal(mock_post_info)
      end

      it "re-renders the 'edit' template" do
        PostInfo.stub(:find).and_return(mock_post_info(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested post_info" do
      PostInfo.should_receive(:find).with("37").and_return(mock_post_info)
      mock_post_info.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the post_infos list" do
      PostInfo.stub(:find).and_return(mock_post_info(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(post_infos_url)
    end
  end

end
