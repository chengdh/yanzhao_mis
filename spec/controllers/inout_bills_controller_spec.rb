require 'spec_helper'

describe InoutBillsController do

  def mock_inout_bill(stubs={})
    @mock_inout_bill ||= mock_model(InoutBill, stubs)
  end

  describe "GET index" do
    it "assigns all inout_bills as @inout_bills" do
      InoutBill.stub(:find).with(:all).and_return([mock_inout_bill])
      get :index
      assigns[:inout_bills].should == [mock_inout_bill]
    end
  end

  describe "GET show" do
    it "assigns the requested inout_bill as @inout_bill" do
      InoutBill.stub(:find).with("37").and_return(mock_inout_bill)
      get :show, :id => "37"
      assigns[:inout_bill].should equal(mock_inout_bill)
    end
  end

  describe "GET new" do
    it "assigns a new inout_bill as @inout_bill" do
      InoutBill.stub(:new).and_return(mock_inout_bill)
      get :new
      assigns[:inout_bill].should equal(mock_inout_bill)
    end
  end

  describe "GET edit" do
    it "assigns the requested inout_bill as @inout_bill" do
      InoutBill.stub(:find).with("37").and_return(mock_inout_bill)
      get :edit, :id => "37"
      assigns[:inout_bill].should equal(mock_inout_bill)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created inout_bill as @inout_bill" do
        InoutBill.stub(:new).with({'these' => 'params'}).and_return(mock_inout_bill(:save => true))
        post :create, :inout_bill => {:these => 'params'}
        assigns[:inout_bill].should equal(mock_inout_bill)
      end

      it "redirects to the created inout_bill" do
        InoutBill.stub(:new).and_return(mock_inout_bill(:save => true))
        post :create, :inout_bill => {}
        response.should redirect_to(inout_bill_url(mock_inout_bill))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved inout_bill as @inout_bill" do
        InoutBill.stub(:new).with({'these' => 'params'}).and_return(mock_inout_bill(:save => false))
        post :create, :inout_bill => {:these => 'params'}
        assigns[:inout_bill].should equal(mock_inout_bill)
      end

      it "re-renders the 'new' template" do
        InoutBill.stub(:new).and_return(mock_inout_bill(:save => false))
        post :create, :inout_bill => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested inout_bill" do
        InoutBill.should_receive(:find).with("37").and_return(mock_inout_bill)
        mock_inout_bill.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :inout_bill => {:these => 'params'}
      end

      it "assigns the requested inout_bill as @inout_bill" do
        InoutBill.stub(:find).and_return(mock_inout_bill(:update_attributes => true))
        put :update, :id => "1"
        assigns[:inout_bill].should equal(mock_inout_bill)
      end

      it "redirects to the inout_bill" do
        InoutBill.stub(:find).and_return(mock_inout_bill(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(inout_bill_url(mock_inout_bill))
      end
    end

    describe "with invalid params" do
      it "updates the requested inout_bill" do
        InoutBill.should_receive(:find).with("37").and_return(mock_inout_bill)
        mock_inout_bill.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :inout_bill => {:these => 'params'}
      end

      it "assigns the inout_bill as @inout_bill" do
        InoutBill.stub(:find).and_return(mock_inout_bill(:update_attributes => false))
        put :update, :id => "1"
        assigns[:inout_bill].should equal(mock_inout_bill)
      end

      it "re-renders the 'edit' template" do
        InoutBill.stub(:find).and_return(mock_inout_bill(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested inout_bill" do
      InoutBill.should_receive(:find).with("37").and_return(mock_inout_bill)
      mock_inout_bill.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the inout_bills list" do
      InoutBill.stub(:find).and_return(mock_inout_bill(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(inout_bills_url)
    end
  end

end
