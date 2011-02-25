class VotesController < ApplicationController
  def new
    mth = Date.today.strftime("%Y%m")
    cur_org = current_user.org
    @vote = Vote.new_with_mth_org(mth,cur_org)
  end
end
