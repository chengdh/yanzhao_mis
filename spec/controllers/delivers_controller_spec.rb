require 'spec_helper'

describe DeliversController do

  def mock_deliver(stubs={})
    @mock_deliver ||= mock_model(Deliver, stubs)
  end

  describe "GET index" do
    it "assigns all delivers as @delivers" do
      Deliver.stub(:find).with(:all).and_return([mock_deliver])
      get :index
      assigns[:delivers].should == [mock_deliver]
    end
  end

  describe "GET show" do
    it "assigns the requested deliver as @deliver" do
      Deliver.stub(:find).with("37").and_return(mock_deliver)
      get :show, :id => "37"
      assigns[:deliver].should equal(mock_deliver)
    end
  end

  describe "GET new" do
    it "assigns a new deliver as @deliver" do
      Deliver.stub(:new).and_return(mock_deliver)
      get :new
      assigns[:deliver].should equal(mock_deliver)
    end
  end

  describe "GET edit" do
    it "assigns the requested deliver as @deliver" do
      Deliver.stub(:find).with("37").and_return(mock_deliver)
      get :edit, :id => "37"
      assigns[:deliver].should equal(mock_deliver)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created deliver as @deliver" do
        Deliver.stub(:new).with({'these' => 'params'}).and_return(mock_deliver(:save => true))
        post :create, :deliver => {:these => 'params'}
        assigns[:deliver].should equal(mock_deliver)
      end

      it "redirects to the created deliver" do
        Deliver.stub(:new).and_return(mock_deliver(:save => true))
        post :create, :deliver => {}
        response.should redirect_to(deliver_url(mock_deliver))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved deliver as @deliver" do
        Deliver.stub(:new).with({'these' => 'params'}).and_return(mock_deliver(:save => false))
        post :create, :deliver => {:these => 'params'}
        assigns[:deliver].should equal(mock_deliver)
      end

      it "re-renders the 'new' template" do
        Deliver.stub(:new).and_return(mock_deliver(:save => false))
        post :create, :deliver => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested deliver" do
        Deliver.should_receive(:find).with("37").and_return(mock_deliver)
        mock_deliver.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :deliver => {:these => 'params'}
      end

      it "assigns the requested deliver as @deliver" do
        Deliver.stub(:find).and_return(mock_deliver(:update_attributes => true))
        put :update, :id => "1"
        assigns[:deliver].should equal(mock_deliver)
      end

      it "redirects to the deliver" do
        Deliver.stub(:find).and_return(mock_deliver(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(deliver_url(mock_deliver))
      end
    end

    describe "with invalid params" do
      it "updates the requested deliver" do
        Deliver.should_receive(:find).with("37").and_return(mock_deliver)
        mock_deliver.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :deliver => {:these => 'params'}
      end

      it "assigns the deliver as @deliver" do
        Deliver.stub(:find).and_return(mock_deliver(:update_attributes => false))
        put :update, :id => "1"
        assigns[:deliver].should equal(mock_deliver)
      end

      it "re-renders the 'edit' template" do
        Deliver.stub(:find).and_return(mock_deliver(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested deliver" do
      Deliver.should_receive(:find).with("37").and_return(mock_deliver)
      mock_deliver.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the delivers list" do
      Deliver.stub(:find).and_return(mock_deliver(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(delivers_url)
    end
  end

end
