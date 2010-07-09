require 'spec_helper'

describe DurableReceiptsController do

  def mock_durable_receipt(stubs={})
    @mock_durable_receipt ||= mock_model(DurableReceipt, stubs)
  end

  describe "GET index" do
    it "assigns all durable_receipts as @durable_receipts" do
      DurableReceipt.stub(:find).with(:all).and_return([mock_durable_receipt])
      get :index
      assigns[:durable_receipts].should == [mock_durable_receipt]
    end
  end

  describe "GET show" do
    it "assigns the requested durable_receipt as @durable_receipt" do
      DurableReceipt.stub(:find).with("37").and_return(mock_durable_receipt)
      get :show, :id => "37"
      assigns[:durable_receipt].should equal(mock_durable_receipt)
    end
  end

  describe "GET new" do
    it "assigns a new durable_receipt as @durable_receipt" do
      DurableReceipt.stub(:new).and_return(mock_durable_receipt)
      get :new
      assigns[:durable_receipt].should equal(mock_durable_receipt)
    end
  end

  describe "GET edit" do
    it "assigns the requested durable_receipt as @durable_receipt" do
      DurableReceipt.stub(:find).with("37").and_return(mock_durable_receipt)
      get :edit, :id => "37"
      assigns[:durable_receipt].should equal(mock_durable_receipt)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created durable_receipt as @durable_receipt" do
        DurableReceipt.stub(:new).with({'these' => 'params'}).and_return(mock_durable_receipt(:save => true))
        post :create, :durable_receipt => {:these => 'params'}
        assigns[:durable_receipt].should equal(mock_durable_receipt)
      end

      it "redirects to the created durable_receipt" do
        DurableReceipt.stub(:new).and_return(mock_durable_receipt(:save => true))
        post :create, :durable_receipt => {}
        response.should redirect_to(durable_receipt_url(mock_durable_receipt))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved durable_receipt as @durable_receipt" do
        DurableReceipt.stub(:new).with({'these' => 'params'}).and_return(mock_durable_receipt(:save => false))
        post :create, :durable_receipt => {:these => 'params'}
        assigns[:durable_receipt].should equal(mock_durable_receipt)
      end

      it "re-renders the 'new' template" do
        DurableReceipt.stub(:new).and_return(mock_durable_receipt(:save => false))
        post :create, :durable_receipt => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested durable_receipt" do
        DurableReceipt.should_receive(:find).with("37").and_return(mock_durable_receipt)
        mock_durable_receipt.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :durable_receipt => {:these => 'params'}
      end

      it "assigns the requested durable_receipt as @durable_receipt" do
        DurableReceipt.stub(:find).and_return(mock_durable_receipt(:update_attributes => true))
        put :update, :id => "1"
        assigns[:durable_receipt].should equal(mock_durable_receipt)
      end

      it "redirects to the durable_receipt" do
        DurableReceipt.stub(:find).and_return(mock_durable_receipt(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(durable_receipt_url(mock_durable_receipt))
      end
    end

    describe "with invalid params" do
      it "updates the requested durable_receipt" do
        DurableReceipt.should_receive(:find).with("37").and_return(mock_durable_receipt)
        mock_durable_receipt.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :durable_receipt => {:these => 'params'}
      end

      it "assigns the durable_receipt as @durable_receipt" do
        DurableReceipt.stub(:find).and_return(mock_durable_receipt(:update_attributes => false))
        put :update, :id => "1"
        assigns[:durable_receipt].should equal(mock_durable_receipt)
      end

      it "re-renders the 'edit' template" do
        DurableReceipt.stub(:find).and_return(mock_durable_receipt(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested durable_receipt" do
      DurableReceipt.should_receive(:find).with("37").and_return(mock_durable_receipt)
      mock_durable_receipt.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the durable_receipts list" do
      DurableReceipt.stub(:find).and_return(mock_durable_receipt(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(durable_receipts_url)
    end
  end

end
