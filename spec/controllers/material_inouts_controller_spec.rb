require 'spec_helper'

describe MaterialInoutsController do

  def mock_material_inout(stubs={})
    @mock_material_inout ||= mock_model(MaterialInout, stubs)
  end

  describe "GET index" do
    it "assigns all material_inouts as @material_inouts" do
      MaterialInout.stub(:find).with(:all).and_return([mock_material_inout])
      get :index
      assigns[:material_inouts].should == [mock_material_inout]
    end
  end

  describe "GET show" do
    it "assigns the requested material_inout as @material_inout" do
      MaterialInout.stub(:find).with("37").and_return(mock_material_inout)
      get :show, :id => "37"
      assigns[:material_inout].should equal(mock_material_inout)
    end
  end

  describe "GET new" do
    it "assigns a new material_inout as @material_inout" do
      MaterialInout.stub(:new).and_return(mock_material_inout)
      get :new
      assigns[:material_inout].should equal(mock_material_inout)
    end
  end

  describe "GET edit" do
    it "assigns the requested material_inout as @material_inout" do
      MaterialInout.stub(:find).with("37").and_return(mock_material_inout)
      get :edit, :id => "37"
      assigns[:material_inout].should equal(mock_material_inout)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created material_inout as @material_inout" do
        MaterialInout.stub(:new).with({'these' => 'params'}).and_return(mock_material_inout(:save => true))
        post :create, :material_inout => {:these => 'params'}
        assigns[:material_inout].should equal(mock_material_inout)
      end

      it "redirects to the created material_inout" do
        MaterialInout.stub(:new).and_return(mock_material_inout(:save => true))
        post :create, :material_inout => {}
        response.should redirect_to(material_inout_url(mock_material_inout))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved material_inout as @material_inout" do
        MaterialInout.stub(:new).with({'these' => 'params'}).and_return(mock_material_inout(:save => false))
        post :create, :material_inout => {:these => 'params'}
        assigns[:material_inout].should equal(mock_material_inout)
      end

      it "re-renders the 'new' template" do
        MaterialInout.stub(:new).and_return(mock_material_inout(:save => false))
        post :create, :material_inout => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested material_inout" do
        MaterialInout.should_receive(:find).with("37").and_return(mock_material_inout)
        mock_material_inout.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :material_inout => {:these => 'params'}
      end

      it "assigns the requested material_inout as @material_inout" do
        MaterialInout.stub(:find).and_return(mock_material_inout(:update_attributes => true))
        put :update, :id => "1"
        assigns[:material_inout].should equal(mock_material_inout)
      end

      it "redirects to the material_inout" do
        MaterialInout.stub(:find).and_return(mock_material_inout(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(material_inout_url(mock_material_inout))
      end
    end

    describe "with invalid params" do
      it "updates the requested material_inout" do
        MaterialInout.should_receive(:find).with("37").and_return(mock_material_inout)
        mock_material_inout.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :material_inout => {:these => 'params'}
      end

      it "assigns the material_inout as @material_inout" do
        MaterialInout.stub(:find).and_return(mock_material_inout(:update_attributes => false))
        put :update, :id => "1"
        assigns[:material_inout].should equal(mock_material_inout)
      end

      it "re-renders the 'edit' template" do
        MaterialInout.stub(:find).and_return(mock_material_inout(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested material_inout" do
      MaterialInout.should_receive(:find).with("37").and_return(mock_material_inout)
      mock_material_inout.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the material_inouts list" do
      MaterialInout.stub(:find).and_return(mock_material_inout(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(material_inouts_url)
    end
  end

end
