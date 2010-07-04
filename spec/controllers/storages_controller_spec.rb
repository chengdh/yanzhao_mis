require 'spec_helper'

describe StoragesController do

  def mock_storage(stubs={})
    @mock_storage ||= mock_model(Storage, stubs)
  end

  describe "GET index" do
    it "assigns all storages as @storages" do
      Storage.stub(:find).with(:all).and_return([mock_storage])
      get :index
      assigns[:storages].should == [mock_storage]
    end
  end

  describe "GET show" do
    it "assigns the requested storage as @storage" do
      Storage.stub(:find).with("37").and_return(mock_storage)
      get :show, :id => "37"
      assigns[:storage].should equal(mock_storage)
    end
  end

  describe "GET new" do
    it "assigns a new storage as @storage" do
      Storage.stub(:new).and_return(mock_storage)
      get :new
      assigns[:storage].should equal(mock_storage)
    end
  end

  describe "GET edit" do
    it "assigns the requested storage as @storage" do
      Storage.stub(:find).with("37").and_return(mock_storage)
      get :edit, :id => "37"
      assigns[:storage].should equal(mock_storage)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created storage as @storage" do
        Storage.stub(:new).with({'these' => 'params'}).and_return(mock_storage(:save => true))
        post :create, :storage => {:these => 'params'}
        assigns[:storage].should equal(mock_storage)
      end

      it "redirects to the created storage" do
        Storage.stub(:new).and_return(mock_storage(:save => true))
        post :create, :storage => {}
        response.should redirect_to(storage_url(mock_storage))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved storage as @storage" do
        Storage.stub(:new).with({'these' => 'params'}).and_return(mock_storage(:save => false))
        post :create, :storage => {:these => 'params'}
        assigns[:storage].should equal(mock_storage)
      end

      it "re-renders the 'new' template" do
        Storage.stub(:new).and_return(mock_storage(:save => false))
        post :create, :storage => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested storage" do
        Storage.should_receive(:find).with("37").and_return(mock_storage)
        mock_storage.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :storage => {:these => 'params'}
      end

      it "assigns the requested storage as @storage" do
        Storage.stub(:find).and_return(mock_storage(:update_attributes => true))
        put :update, :id => "1"
        assigns[:storage].should equal(mock_storage)
      end

      it "redirects to the storage" do
        Storage.stub(:find).and_return(mock_storage(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(storage_url(mock_storage))
      end
    end

    describe "with invalid params" do
      it "updates the requested storage" do
        Storage.should_receive(:find).with("37").and_return(mock_storage)
        mock_storage.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :storage => {:these => 'params'}
      end

      it "assigns the storage as @storage" do
        Storage.stub(:find).and_return(mock_storage(:update_attributes => false))
        put :update, :id => "1"
        assigns[:storage].should equal(mock_storage)
      end

      it "re-renders the 'edit' template" do
        Storage.stub(:find).and_return(mock_storage(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested storage" do
      Storage.should_receive(:find).with("37").and_return(mock_storage)
      mock_storage.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the storages list" do
      Storage.stub(:find).and_return(mock_storage(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(storages_url)
    end
  end

end
