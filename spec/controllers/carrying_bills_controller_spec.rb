require 'spec_helper'

describe CarryingBillsController do

  def mock_carrying_bill(stubs={})
    @mock_carrying_bill ||= mock_model(CarryingBill, stubs)
  end

  describe "GET index" do
    it "assigns all carrying_bills as @carrying_bills" do
      CarryingBill.stub(:find).with(:all).and_return([mock_carrying_bill])
      get :index
      assigns[:carrying_bills].should == [mock_carrying_bill]
    end
  end

  describe "GET show" do
    it "assigns the requested carrying_bill as @carrying_bill" do
      CarryingBill.stub(:find).with("37").and_return(mock_carrying_bill)
      get :show, :id => "37"
      assigns[:carrying_bill].should equal(mock_carrying_bill)
    end
  end

  describe "GET new" do
    it "assigns a new carrying_bill as @carrying_bill" do
      CarryingBill.stub(:new).and_return(mock_carrying_bill)
      get :new
      assigns[:carrying_bill].should equal(mock_carrying_bill)
    end
  end

  describe "GET edit" do
    it "assigns the requested carrying_bill as @carrying_bill" do
      CarryingBill.stub(:find).with("37").and_return(mock_carrying_bill)
      get :edit, :id => "37"
      assigns[:carrying_bill].should equal(mock_carrying_bill)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created carrying_bill as @carrying_bill" do
        CarryingBill.stub(:new).with({'these' => 'params'}).and_return(mock_carrying_bill(:save => true))
        post :create, :carrying_bill => {:these => 'params'}
        assigns[:carrying_bill].should equal(mock_carrying_bill)
      end

      it "redirects to the created carrying_bill" do
        CarryingBill.stub(:new).and_return(mock_carrying_bill(:save => true))
        post :create, :carrying_bill => {}
        response.should redirect_to(carrying_bill_url(mock_carrying_bill))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved carrying_bill as @carrying_bill" do
        CarryingBill.stub(:new).with({'these' => 'params'}).and_return(mock_carrying_bill(:save => false))
        post :create, :carrying_bill => {:these => 'params'}
        assigns[:carrying_bill].should equal(mock_carrying_bill)
      end

      it "re-renders the 'new' template" do
        CarryingBill.stub(:new).and_return(mock_carrying_bill(:save => false))
        post :create, :carrying_bill => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested carrying_bill" do
        CarryingBill.should_receive(:find).with("37").and_return(mock_carrying_bill)
        mock_carrying_bill.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :carrying_bill => {:these => 'params'}
      end

      it "assigns the requested carrying_bill as @carrying_bill" do
        CarryingBill.stub(:find).and_return(mock_carrying_bill(:update_attributes => true))
        put :update, :id => "1"
        assigns[:carrying_bill].should equal(mock_carrying_bill)
      end

      it "redirects to the carrying_bill" do
        CarryingBill.stub(:find).and_return(mock_carrying_bill(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(carrying_bill_url(mock_carrying_bill))
      end
    end

    describe "with invalid params" do
      it "updates the requested carrying_bill" do
        CarryingBill.should_receive(:find).with("37").and_return(mock_carrying_bill)
        mock_carrying_bill.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :carrying_bill => {:these => 'params'}
      end

      it "assigns the carrying_bill as @carrying_bill" do
        CarryingBill.stub(:find).and_return(mock_carrying_bill(:update_attributes => false))
        put :update, :id => "1"
        assigns[:carrying_bill].should equal(mock_carrying_bill)
      end

      it "re-renders the 'edit' template" do
        CarryingBill.stub(:find).and_return(mock_carrying_bill(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested carrying_bill" do
      CarryingBill.should_receive(:find).with("37").and_return(mock_carrying_bill)
      mock_carrying_bill.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the carrying_bills list" do
      CarryingBill.stub(:find).and_return(mock_carrying_bill(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(carrying_bills_url)
    end
  end

end
