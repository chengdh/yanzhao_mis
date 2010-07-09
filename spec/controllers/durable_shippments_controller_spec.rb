require 'spec_helper'

describe DurableShippmentsController do

  def mock_durable_shippment(stubs={})
    @mock_durable_shippment ||= mock_model(DurableShippment, stubs)
  end

  describe "GET index" do
    it "assigns all durable_shippments as @durable_shippments" do
      DurableShippment.stub(:find).with(:all).and_return([mock_durable_shippment])
      get :index
      assigns[:durable_shippments].should == [mock_durable_shippment]
    end
  end

  describe "GET show" do
    it "assigns the requested durable_shippment as @durable_shippment" do
      DurableShippment.stub(:find).with("37").and_return(mock_durable_shippment)
      get :show, :id => "37"
      assigns[:durable_shippment].should equal(mock_durable_shippment)
    end
  end

  describe "GET new" do
    it "assigns a new durable_shippment as @durable_shippment" do
      DurableShippment.stub(:new).and_return(mock_durable_shippment)
      get :new
      assigns[:durable_shippment].should equal(mock_durable_shippment)
    end
  end

  describe "GET edit" do
    it "assigns the requested durable_shippment as @durable_shippment" do
      DurableShippment.stub(:find).with("37").and_return(mock_durable_shippment)
      get :edit, :id => "37"
      assigns[:durable_shippment].should equal(mock_durable_shippment)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created durable_shippment as @durable_shippment" do
        DurableShippment.stub(:new).with({'these' => 'params'}).and_return(mock_durable_shippment(:save => true))
        post :create, :durable_shippment => {:these => 'params'}
        assigns[:durable_shippment].should equal(mock_durable_shippment)
      end

      it "redirects to the created durable_shippment" do
        DurableShippment.stub(:new).and_return(mock_durable_shippment(:save => true))
        post :create, :durable_shippment => {}
        response.should redirect_to(durable_shippment_url(mock_durable_shippment))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved durable_shippment as @durable_shippment" do
        DurableShippment.stub(:new).with({'these' => 'params'}).and_return(mock_durable_shippment(:save => false))
        post :create, :durable_shippment => {:these => 'params'}
        assigns[:durable_shippment].should equal(mock_durable_shippment)
      end

      it "re-renders the 'new' template" do
        DurableShippment.stub(:new).and_return(mock_durable_shippment(:save => false))
        post :create, :durable_shippment => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested durable_shippment" do
        DurableShippment.should_receive(:find).with("37").and_return(mock_durable_shippment)
        mock_durable_shippment.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :durable_shippment => {:these => 'params'}
      end

      it "assigns the requested durable_shippment as @durable_shippment" do
        DurableShippment.stub(:find).and_return(mock_durable_shippment(:update_attributes => true))
        put :update, :id => "1"
        assigns[:durable_shippment].should equal(mock_durable_shippment)
      end

      it "redirects to the durable_shippment" do
        DurableShippment.stub(:find).and_return(mock_durable_shippment(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(durable_shippment_url(mock_durable_shippment))
      end
    end

    describe "with invalid params" do
      it "updates the requested durable_shippment" do
        DurableShippment.should_receive(:find).with("37").and_return(mock_durable_shippment)
        mock_durable_shippment.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :durable_shippment => {:these => 'params'}
      end

      it "assigns the durable_shippment as @durable_shippment" do
        DurableShippment.stub(:find).and_return(mock_durable_shippment(:update_attributes => false))
        put :update, :id => "1"
        assigns[:durable_shippment].should equal(mock_durable_shippment)
      end

      it "re-renders the 'edit' template" do
        DurableShippment.stub(:find).and_return(mock_durable_shippment(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested durable_shippment" do
      DurableShippment.should_receive(:find).with("37").and_return(mock_durable_shippment)
      mock_durable_shippment.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the durable_shippments list" do
      DurableShippment.stub(:find).and_return(mock_durable_shippment(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(durable_shippments_url)
    end
  end

end
