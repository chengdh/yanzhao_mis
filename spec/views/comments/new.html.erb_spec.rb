require 'spec_helper'

describe "/comments/new.html.erb" do
  include CommentsHelper

  before(:each) do
    assigns[:comment] = stub_model(Comment,
      :new_record? => true,
      :post => 1,
      :body => "value for body",
      :user => 1
    )
  end

  it "renders new comment form" do
    render

    response.should have_tag("form[action=?][method=post]", comments_path) do
      with_tag("input#comment_post[name=?]", "comment[post]")
      with_tag("input#comment_body[name=?]", "comment[body]")
      with_tag("input#comment_user[name=?]", "comment[user]")
    end
  end
end
