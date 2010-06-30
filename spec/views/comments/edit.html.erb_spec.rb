require 'spec_helper'

describe "/comments/edit.html.erb" do
  include CommentsHelper

  before(:each) do
    assigns[:comment] = @comment = stub_model(Comment,
      :new_record? => false,
      :post => 1,
      :body => "value for body",
      :user => 1
    )
  end

  it "renders the edit comment form" do
    render

    response.should have_tag("form[action=#{comment_path(@comment)}][method=post]") do
      with_tag('input#comment_post[name=?]', "comment[post]")
      with_tag('input#comment_body[name=?]', "comment[body]")
      with_tag('input#comment_user[name=?]', "comment[user]")
    end
  end
end
