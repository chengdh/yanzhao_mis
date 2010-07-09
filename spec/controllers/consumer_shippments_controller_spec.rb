require 'spec_helper'

describe ConsumerShippmentsController do

  def mock_consumer_shippment(stubs={})
    @mock_consumer_shippment ||= mock_model(ConsumerShippment, stubs)
  end

  describe "GET index" do
    it "assigns all consumer_shippments as @consumer_shippments" do
      ConsumerShippment.stub(:find).with(:all).and_return([mock_consumer_shippment])
      get :index
      assigns[:consumer_shippments].should == [mock_consumer_shippment]
    end
  end

  describe "GET show" do
    it "assigns the requested consumer_shippment as @consumer_shippment" do
      ConsumerShippment.stub(:find).with("37").and_return(mock_consumer_shippment)
      get :show, :id => "37"
      assigns[:consumer_shippment].should equal(mock_consumer_shippment)
    end
  end

  describe "GET new" do
    it "assigns a new consumer_shippment as @consumer_shippment" do
      ConsumerShippment.stub(:new).and_return(mock_consumer_shippment)
      get :new
      assigns[:consumer_shippment].should equal(mock_consumer_shippment)
    end
  end

  describe "GET edit" do
    it "assigns the requested consumer_shippment as @consumer_shippment" do
      ConsumerShippment.stub(:find).with("37").and_return(mock_consumer_shippment)
      get :edit, :id => "37"
      assigns[:consumer_shippment].should equal(mock_consumer_shippment)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created consumer_shippment as @consumer_shippment" do
        ConsumerShippment.stub(:new).with({'these' => 'params'}).and_return(mock_consumer_shippment(:save => true))
        post :create, :consumer_shippment => {:these => 'params'}
        assigns[:consumer_shippment].should equal(mock_consumer_shippment)
      end

      it "redirects to the created consumer_shippment" do
        ConsumerShippment.stub(:new).and_return(mock_consumer_shippment(:save => true))
        post :create, :consumer_shippment => {}
        response.should redirect_to(consumer_shippment_url(mock_consumer_shippment))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved consumer_shippment as @consumer_shippment" do
        ConsumerShippment.stub(:new).with({'these' => 'params'}).and_return(mock_consumer_shippment(:save => false))
        post :create, :consumer_shippment => {:these => 'params'}
        assigns[:consumer_shippment].should equal(mock_consumer_shippment)
      end

      it "re-renders the 'new' template" do
        ConsumerShippment.stub(:new).and_return(mock_consumer_shippment(:save => false))
        post :create, :consumer_shippment => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested consumer_shippment" do
        ConsumerShippment.should_receive(:find).with("37").and_return(mock_consumer_shippment)
        mock_consumer_shippment.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :consumer_shippment => {:these => 'params'}
      end

      it "assigns the requested consumer_shippment as @consumer_shippment" do
        ConsumerShippment.stub(:find).and_return(mock_consumer_shippment(:update_attributes => true))
        put :update, :id => "1"
        assigns[:consumer_shippment].should equal(mock_consumer_shippment)
      end

      it "redirects to the consumer_shippment" do
        ConsumerShippment.stub(:find).and_return(mock_consumer_shippment(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(consumer_shippment_url(mock_consumer_shippment))
      end
    end

    describe "with invalid params" do
      it "updates the requested consumer_shippment" do
        ConsumerShippment.should_receive(:find).with("37").and_return(mock_consumer_shippment)
        mock_consumer_shippment.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :consumer_shippment => {:these => 'params'}
      end

      it "assigns the consumer_shippment as @consumer_shippment" do
        ConsumerShippment.stub(:find).and_return(mock_consumer_shippment(:update_attributes => false))
        put :update, :id => "1"
        assigns[:consumer_shippment].should equal(mock_consumer_shippment)
      end

      it "re-renders the 'edit' template" do
        ConsumerShippment.stub(:find).and_return(mock_consumer_shippment(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested consumer_shippment" do
      ConsumerShippment.should_receive(:find).with("37").and_return(mock_consumer_shippment)
      mock_consumer_shippment.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the consumer_shippments list" do
      ConsumerShippment.stub(:find).and_return(mock_consumer_shippment(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(consumer_shippments_url)
    end
  end

end
