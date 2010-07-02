require 'spec_helper'

describe "/settlements/show.html.erb" do
  include SettlementsHelper
  before(:each) do
    assigns[:settlement] = @settlement = stub_model(Settlement,
      :org => 1,
      :user => 1,
      :mth => "value for mth",
      :is_active => false,
      :start_fee => 9.99,
      :start_carrying_fee => 9.99,
      :start_net_income => 9.99,
      :start_push_money => 9.99,
      :back_fee => 9.99,
      :back_carrying_fee => 9.99,
      :back_net_income => 9.99,
      :back_push_money => 9.99,
      :total_push_money => 9.99,
      :total_subsidy => 9.99,
      :total_deduction => 9.99,
      :act_push_money => 9.99
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ mth/)
    response.should have_text(/false/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
  end
end
