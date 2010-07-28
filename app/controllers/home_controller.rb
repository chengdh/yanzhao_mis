class HomeController < ApplicationController
  def index
    redirect_to notices_url("search[state_is]" => "published")
  end
end
