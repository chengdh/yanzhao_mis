class VotesController < BaseController
  def new
    mth = Date.today.strftime("%Y%m")
    cur_org = current_user.org
    @vote = Vote.new_with_mth_org(mth,cur_org)
    @vote.user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => the_model }
    end

  end
end
