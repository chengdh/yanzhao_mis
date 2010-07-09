require 'spec_helper'

describe ConsumerReceiptsController do

  def mock_consumer_receipt(stubs={})
    @mock_consumer_receipt ||= mock_model(ConsumerReceipt, stubs)
  end

  describe "GET index" do
    it "assigns all consumer_receipts as @consumer_receipts" do
      ConsumerReceipt.stub(:find).with(:all).and_return([mock_consumer_receipt])
      get :index
      assigns[:consumer_receipts].should == [mock_consumer_receipt]
    end
  end

  describe "GET show" do
    it "assigns the requested consumer_receipt as @consumer_receipt" do
      ConsumerReceipt.stub(:find).with("37").and_return(mock_consumer_receipt)
      get :show, :id => "37"
      assigns[:consumer_receipt].should equal(mock_consumer_receipt)
    end
  end

  describe "GET new" do
    it "assigns a new consumer_receipt as @consumer_receipt" do
      ConsumerReceipt.stub(:new).and_return(mock_consumer_receipt)
      get :new
      assigns[:consumer_receipt].should equal(mock_consumer_receipt)
    end
  end

  describe "GET edit" do
    it "assigns the requested consumer_receipt as @consumer_receipt" do
      ConsumerReceipt.stub(:find).with("37").and_return(mock_consumer_receipt)
      get :edit, :id => "37"
      assigns[:consumer_receipt].should equal(mock_consumer_receipt)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created consumer_receipt as @consumer_receipt" do
        ConsumerReceipt.stub(:new).with({'these' => 'params'}).and_return(mock_consumer_receipt(:save => true))
        post :create, :consumer_receipt => {:these => 'params'}
        assigns[:consumer_receipt].should equal(mock_consumer_receipt)
      end

      it "redirects to the created consumer_receipt" do
        ConsumerReceipt.stub(:new).and_return(mock_consumer_receipt(:save => true))
        post :create, :consumer_receipt => {}
        response.should redirect_to(consumer_receipt_url(mock_consumer_receipt))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved consumer_receipt as @consumer_receipt" do
        ConsumerReceipt.stub(:new).with({'these' => 'params'}).and_return(mock_consumer_receipt(:save => false))
        post :create, :consumer_receipt => {:these => 'params'}
        assigns[:consumer_receipt].should equal(mock_consumer_receipt)
      end

      it "re-renders the 'new' template" do
        ConsumerReceipt.stub(:new).and_return(mock_consumer_receipt(:save => false))
        post :create, :consumer_receipt => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested consumer_receipt" do
        ConsumerReceipt.should_receive(:find).with("37").and_return(mock_consumer_receipt)
        mock_consumer_receipt.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :consumer_receipt => {:these => 'params'}
      end

      it "assigns the requested consumer_receipt as @consumer_receipt" do
        ConsumerReceipt.stub(:find).and_return(mock_consumer_receipt(:update_attributes => true))
        put :update, :id => "1"
        assigns[:consumer_receipt].should equal(mock_consumer_receipt)
      end

      it "redirects to the consumer_receipt" do
        ConsumerReceipt.stub(:find).and_return(mock_consumer_receipt(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(consumer_receipt_url(mock_consumer_receipt))
      end
    end

    describe "with invalid params" do
      it "updates the requested consumer_receipt" do
        ConsumerReceipt.should_receive(:find).with("37").and_return(mock_consumer_receipt)
        mock_consumer_receipt.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :consumer_receipt => {:these => 'params'}
      end

      it "assigns the consumer_receipt as @consumer_receipt" do
        ConsumerReceipt.stub(:find).and_return(mock_consumer_receipt(:update_attributes => false))
        put :update, :id => "1"
        assigns[:consumer_receipt].should equal(mock_consumer_receipt)
      end

      it "re-renders the 'edit' template" do
        ConsumerReceipt.stub(:find).and_return(mock_consumer_receipt(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested consumer_receipt" do
      ConsumerReceipt.should_receive(:find).with("37").and_return(mock_consumer_receipt)
      mock_consumer_receipt.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the consumer_receipts list" do
      ConsumerReceipt.stub(:find).and_return(mock_consumer_receipt(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(consumer_receipts_url)
    end
  end

end
