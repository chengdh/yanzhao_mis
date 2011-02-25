class PunishmentsController < BaseController
  # GET /violations/new
  # GET /violations/new.xml
  def new
    if params[:violation_id].blank?
      @punishment = Punishment.new
    else
      @punishment = Punishment.new_with_violation(Violation.find(params[:violation_id]))
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @violation }
    end
  end
end
