require 'spec_helper'

describe ConfirmsController do

  def mock_confirm(stubs={})
    @mock_confirm ||= mock_model(Confirm, stubs)
  end

  describe "GET index" do
    it "assigns all confirms as @confirms" do
      Confirm.stub(:find).with(:all).and_return([mock_confirm])
      get :index
      assigns[:confirms].should == [mock_confirm]
    end
  end

  describe "GET show" do
    it "assigns the requested confirm as @confirm" do
      Confirm.stub(:find).with("37").and_return(mock_confirm)
      get :show, :id => "37"
      assigns[:confirm].should equal(mock_confirm)
    end
  end

  describe "GET new" do
    it "assigns a new confirm as @confirm" do
      Confirm.stub(:new).and_return(mock_confirm)
      get :new
      assigns[:confirm].should equal(mock_confirm)
    end
  end

  describe "GET edit" do
    it "assigns the requested confirm as @confirm" do
      Confirm.stub(:find).with("37").and_return(mock_confirm)
      get :edit, :id => "37"
      assigns[:confirm].should equal(mock_confirm)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created confirm as @confirm" do
        Confirm.stub(:new).with({'these' => 'params'}).and_return(mock_confirm(:save => true))
        post :create, :confirm => {:these => 'params'}
        assigns[:confirm].should equal(mock_confirm)
      end

      it "redirects to the created confirm" do
        Confirm.stub(:new).and_return(mock_confirm(:save => true))
        post :create, :confirm => {}
        response.should redirect_to(confirm_url(mock_confirm))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved confirm as @confirm" do
        Confirm.stub(:new).with({'these' => 'params'}).and_return(mock_confirm(:save => false))
        post :create, :confirm => {:these => 'params'}
        assigns[:confirm].should equal(mock_confirm)
      end

      it "re-renders the 'new' template" do
        Confirm.stub(:new).and_return(mock_confirm(:save => false))
        post :create, :confirm => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested confirm" do
        Confirm.should_receive(:find).with("37").and_return(mock_confirm)
        mock_confirm.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :confirm => {:these => 'params'}
      end

      it "assigns the requested confirm as @confirm" do
        Confirm.stub(:find).and_return(mock_confirm(:update_attributes => true))
        put :update, :id => "1"
        assigns[:confirm].should equal(mock_confirm)
      end

      it "redirects to the confirm" do
        Confirm.stub(:find).and_return(mock_confirm(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(confirm_url(mock_confirm))
      end
    end

    describe "with invalid params" do
      it "updates the requested confirm" do
        Confirm.should_receive(:find).with("37").and_return(mock_confirm)
        mock_confirm.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :confirm => {:these => 'params'}
      end

      it "assigns the confirm as @confirm" do
        Confirm.stub(:find).and_return(mock_confirm(:update_attributes => false))
        put :update, :id => "1"
        assigns[:confirm].should equal(mock_confirm)
      end

      it "re-renders the 'edit' template" do
        Confirm.stub(:find).and_return(mock_confirm(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested confirm" do
      Confirm.should_receive(:find).with("37").and_return(mock_confirm)
      mock_confirm.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the confirms list" do
      Confirm.stub(:find).and_return(mock_confirm(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(confirms_url)
    end
  end

end
