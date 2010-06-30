require 'spec_helper'

describe AddressBooksController do

  def mock_address_book(stubs={})
    @mock_address_book ||= mock_model(AddressBook, stubs)
  end

  describe "GET index" do
    it "assigns all address_books as @address_books" do
      AddressBook.stub(:find).with(:all).and_return([mock_address_book])
      get :index
      assigns[:address_books].should == [mock_address_book]
    end
  end

  describe "GET show" do
    it "assigns the requested address_book as @address_book" do
      AddressBook.stub(:find).with("37").and_return(mock_address_book)
      get :show, :id => "37"
      assigns[:address_book].should equal(mock_address_book)
    end
  end

  describe "GET new" do
    it "assigns a new address_book as @address_book" do
      AddressBook.stub(:new).and_return(mock_address_book)
      get :new
      assigns[:address_book].should equal(mock_address_book)
    end
  end

  describe "GET edit" do
    it "assigns the requested address_book as @address_book" do
      AddressBook.stub(:find).with("37").and_return(mock_address_book)
      get :edit, :id => "37"
      assigns[:address_book].should equal(mock_address_book)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created address_book as @address_book" do
        AddressBook.stub(:new).with({'these' => 'params'}).and_return(mock_address_book(:save => true))
        post :create, :address_book => {:these => 'params'}
        assigns[:address_book].should equal(mock_address_book)
      end

      it "redirects to the created address_book" do
        AddressBook.stub(:new).and_return(mock_address_book(:save => true))
        post :create, :address_book => {}
        response.should redirect_to(address_book_url(mock_address_book))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved address_book as @address_book" do
        AddressBook.stub(:new).with({'these' => 'params'}).and_return(mock_address_book(:save => false))
        post :create, :address_book => {:these => 'params'}
        assigns[:address_book].should equal(mock_address_book)
      end

      it "re-renders the 'new' template" do
        AddressBook.stub(:new).and_return(mock_address_book(:save => false))
        post :create, :address_book => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested address_book" do
        AddressBook.should_receive(:find).with("37").and_return(mock_address_book)
        mock_address_book.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :address_book => {:these => 'params'}
      end

      it "assigns the requested address_book as @address_book" do
        AddressBook.stub(:find).and_return(mock_address_book(:update_attributes => true))
        put :update, :id => "1"
        assigns[:address_book].should equal(mock_address_book)
      end

      it "redirects to the address_book" do
        AddressBook.stub(:find).and_return(mock_address_book(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(address_book_url(mock_address_book))
      end
    end

    describe "with invalid params" do
      it "updates the requested address_book" do
        AddressBook.should_receive(:find).with("37").and_return(mock_address_book)
        mock_address_book.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :address_book => {:these => 'params'}
      end

      it "assigns the address_book as @address_book" do
        AddressBook.stub(:find).and_return(mock_address_book(:update_attributes => false))
        put :update, :id => "1"
        assigns[:address_book].should equal(mock_address_book)
      end

      it "re-renders the 'edit' template" do
        AddressBook.stub(:find).and_return(mock_address_book(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested address_book" do
      AddressBook.should_receive(:find).with("37").and_return(mock_address_book)
      mock_address_book.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the address_books list" do
      AddressBook.stub(:find).and_return(mock_address_book(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(address_books_url)
    end
  end

end
