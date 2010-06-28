require 'spec_helper'

describe RulesController do

  def mock_rule(stubs={})
    @mock_rule ||= mock_model(Rule, stubs)
  end

  describe "GET index" do
    it "assigns all rules as @rules" do
      Rule.stub(:find).with(:all).and_return([mock_rule])
      get :index
      assigns[:rules].should == [mock_rule]
    end
  end

  describe "GET show" do
    it "assigns the requested rule as @rule" do
      Rule.stub(:find).with("37").and_return(mock_rule)
      get :show, :id => "37"
      assigns[:rule].should equal(mock_rule)
    end
  end

  describe "GET new" do
    it "assigns a new rule as @rule" do
      Rule.stub(:new).and_return(mock_rule)
      get :new
      assigns[:rule].should equal(mock_rule)
    end
  end

  describe "GET edit" do
    it "assigns the requested rule as @rule" do
      Rule.stub(:find).with("37").and_return(mock_rule)
      get :edit, :id => "37"
      assigns[:rule].should equal(mock_rule)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created rule as @rule" do
        Rule.stub(:new).with({'these' => 'params'}).and_return(mock_rule(:save => true))
        post :create, :rule => {:these => 'params'}
        assigns[:rule].should equal(mock_rule)
      end

      it "redirects to the created rule" do
        Rule.stub(:new).and_return(mock_rule(:save => true))
        post :create, :rule => {}
        response.should redirect_to(rule_url(mock_rule))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved rule as @rule" do
        Rule.stub(:new).with({'these' => 'params'}).and_return(mock_rule(:save => false))
        post :create, :rule => {:these => 'params'}
        assigns[:rule].should equal(mock_rule)
      end

      it "re-renders the 'new' template" do
        Rule.stub(:new).and_return(mock_rule(:save => false))
        post :create, :rule => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested rule" do
        Rule.should_receive(:find).with("37").and_return(mock_rule)
        mock_rule.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :rule => {:these => 'params'}
      end

      it "assigns the requested rule as @rule" do
        Rule.stub(:find).and_return(mock_rule(:update_attributes => true))
        put :update, :id => "1"
        assigns[:rule].should equal(mock_rule)
      end

      it "redirects to the rule" do
        Rule.stub(:find).and_return(mock_rule(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(rule_url(mock_rule))
      end
    end

    describe "with invalid params" do
      it "updates the requested rule" do
        Rule.should_receive(:find).with("37").and_return(mock_rule)
        mock_rule.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :rule => {:these => 'params'}
      end

      it "assigns the rule as @rule" do
        Rule.stub(:find).and_return(mock_rule(:update_attributes => false))
        put :update, :id => "1"
        assigns[:rule].should equal(mock_rule)
      end

      it "re-renders the 'edit' template" do
        Rule.stub(:find).and_return(mock_rule(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested rule" do
      Rule.should_receive(:find).with("37").and_return(mock_rule)
      mock_rule.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the rules list" do
      Rule.stub(:find).and_return(mock_rule(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(rules_url)
    end
  end

end
