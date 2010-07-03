require 'spec_helper'

describe WarehousesController do

  def mock_warehouse(stubs={})
    @mock_warehouse ||= mock_model(Warehouse, stubs)
  end

  describe "GET index" do
    it "assigns all warehouses as @warehouses" do
      Warehouse.stub(:find).with(:all).and_return([mock_warehouse])
      get :index
      assigns[:warehouses].should == [mock_warehouse]
    end
  end

  describe "GET show" do
    it "assigns the requested warehouse as @warehouse" do
      Warehouse.stub(:find).with("37").and_return(mock_warehouse)
      get :show, :id => "37"
      assigns[:warehouse].should equal(mock_warehouse)
    end
  end

  describe "GET new" do
    it "assigns a new warehouse as @warehouse" do
      Warehouse.stub(:new).and_return(mock_warehouse)
      get :new
      assigns[:warehouse].should equal(mock_warehouse)
    end
  end

  describe "GET edit" do
    it "assigns the requested warehouse as @warehouse" do
      Warehouse.stub(:find).with("37").and_return(mock_warehouse)
      get :edit, :id => "37"
      assigns[:warehouse].should equal(mock_warehouse)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created warehouse as @warehouse" do
        Warehouse.stub(:new).with({'these' => 'params'}).and_return(mock_warehouse(:save => true))
        post :create, :warehouse => {:these => 'params'}
        assigns[:warehouse].should equal(mock_warehouse)
      end

      it "redirects to the created warehouse" do
        Warehouse.stub(:new).and_return(mock_warehouse(:save => true))
        post :create, :warehouse => {}
        response.should redirect_to(warehouse_url(mock_warehouse))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved warehouse as @warehouse" do
        Warehouse.stub(:new).with({'these' => 'params'}).and_return(mock_warehouse(:save => false))
        post :create, :warehouse => {:these => 'params'}
        assigns[:warehouse].should equal(mock_warehouse)
      end

      it "re-renders the 'new' template" do
        Warehouse.stub(:new).and_return(mock_warehouse(:save => false))
        post :create, :warehouse => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested warehouse" do
        Warehouse.should_receive(:find).with("37").and_return(mock_warehouse)
        mock_warehouse.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :warehouse => {:these => 'params'}
      end

      it "assigns the requested warehouse as @warehouse" do
        Warehouse.stub(:find).and_return(mock_warehouse(:update_attributes => true))
        put :update, :id => "1"
        assigns[:warehouse].should equal(mock_warehouse)
      end

      it "redirects to the warehouse" do
        Warehouse.stub(:find).and_return(mock_warehouse(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(warehouse_url(mock_warehouse))
      end
    end

    describe "with invalid params" do
      it "updates the requested warehouse" do
        Warehouse.should_receive(:find).with("37").and_return(mock_warehouse)
        mock_warehouse.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :warehouse => {:these => 'params'}
      end

      it "assigns the warehouse as @warehouse" do
        Warehouse.stub(:find).and_return(mock_warehouse(:update_attributes => false))
        put :update, :id => "1"
        assigns[:warehouse].should equal(mock_warehouse)
      end

      it "re-renders the 'edit' template" do
        Warehouse.stub(:find).and_return(mock_warehouse(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested warehouse" do
      Warehouse.should_receive(:find).with("37").and_return(mock_warehouse)
      mock_warehouse.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the warehouses list" do
      Warehouse.stub(:find).and_return(mock_warehouse(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(warehouses_url)
    end
  end

end
