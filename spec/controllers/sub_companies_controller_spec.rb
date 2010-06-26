require 'spec_helper'

describe SubCompaniesController do

  def mock_sub_company(stubs={})
    @mock_sub_company ||= mock_model(SubCompany, stubs)
  end

  describe "GET index" do
    it "assigns all sub_companies as @sub_companies" do
      SubCompany.stub(:find).with(:all).and_return([mock_sub_company])
      get :index
      assigns[:sub_companies].should == [mock_sub_company]
    end
  end

  describe "GET show" do
    it "assigns the requested sub_company as @sub_company" do
      SubCompany.stub(:find).with("37").and_return(mock_sub_company)
      get :show, :id => "37"
      assigns[:sub_company].should equal(mock_sub_company)
    end
  end

  describe "GET new" do
    it "assigns a new sub_company as @sub_company" do
      SubCompany.stub(:new).and_return(mock_sub_company)
      get :new
      assigns[:sub_company].should equal(mock_sub_company)
    end
  end

  describe "GET edit" do
    it "assigns the requested sub_company as @sub_company" do
      SubCompany.stub(:find).with("37").and_return(mock_sub_company)
      get :edit, :id => "37"
      assigns[:sub_company].should equal(mock_sub_company)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created sub_company as @sub_company" do
        SubCompany.stub(:new).with({'these' => 'params'}).and_return(mock_sub_company(:save => true))
        post :create, :sub_company => {:these => 'params'}
        assigns[:sub_company].should equal(mock_sub_company)
      end

      it "redirects to the created sub_company" do
        SubCompany.stub(:new).and_return(mock_sub_company(:save => true))
        post :create, :sub_company => {}
        response.should redirect_to(sub_company_url(mock_sub_company))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sub_company as @sub_company" do
        SubCompany.stub(:new).with({'these' => 'params'}).and_return(mock_sub_company(:save => false))
        post :create, :sub_company => {:these => 'params'}
        assigns[:sub_company].should equal(mock_sub_company)
      end

      it "re-renders the 'new' template" do
        SubCompany.stub(:new).and_return(mock_sub_company(:save => false))
        post :create, :sub_company => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested sub_company" do
        SubCompany.should_receive(:find).with("37").and_return(mock_sub_company)
        mock_sub_company.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :sub_company => {:these => 'params'}
      end

      it "assigns the requested sub_company as @sub_company" do
        SubCompany.stub(:find).and_return(mock_sub_company(:update_attributes => true))
        put :update, :id => "1"
        assigns[:sub_company].should equal(mock_sub_company)
      end

      it "redirects to the sub_company" do
        SubCompany.stub(:find).and_return(mock_sub_company(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(sub_company_url(mock_sub_company))
      end
    end

    describe "with invalid params" do
      it "updates the requested sub_company" do
        SubCompany.should_receive(:find).with("37").and_return(mock_sub_company)
        mock_sub_company.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :sub_company => {:these => 'params'}
      end

      it "assigns the sub_company as @sub_company" do
        SubCompany.stub(:find).and_return(mock_sub_company(:update_attributes => false))
        put :update, :id => "1"
        assigns[:sub_company].should equal(mock_sub_company)
      end

      it "re-renders the 'edit' template" do
        SubCompany.stub(:find).and_return(mock_sub_company(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested sub_company" do
      SubCompany.should_receive(:find).with("37").and_return(mock_sub_company)
      request.env["HTTP_REFERER"] = sub_companies_url
      mock_sub_company.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the sub_companies list" do
      SubCompany.stub(:find).and_return(mock_sub_company(:destroy => true))
      request.env["HTTP_REFERER"] = sub_companies_url
      delete :destroy, :id => "1"
      response.should redirect_to(sub_companies_url)
    end
  end

end
