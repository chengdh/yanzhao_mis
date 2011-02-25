class ViolationsController < BaseController

  # GET /violations/new
  # GET /violations/new.xml
  def new
    if params[:message_id].blank?
      @violation = Violation.new
    else
      @violation = Violation.new_with_message(BasePublicMessage.find(params[:message_id]))
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @violation }
    end
  end

  # GET /violations/1/edit
  def edit
    @violation = Violation.find(params[:id])
  end

  # POST /violations
  # POST /violations.xml
  def create
    @violation = Violation.new(params[:violation])

    respond_to do |format|
      if @violation.save
        flash[:notice] = 'Violation was successfully created.'
        format.html { redirect_to(@violation) }
        format.xml  { render :xml => @violation, :status => :created, :location => @violation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @violation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /violations/1
  # PUT /violations/1.xml
  def update
    @violation = Violation.find(params[:id])

    respond_to do |format|
      if @violation.update_attributes(params[:violation])
        flash[:notice] = 'Violation was successfully updated.'
        format.html { redirect_to(@violation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @violation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /violations/1
  # DELETE /violations/1.xml
  def destroy
    @violation = Violation.find(params[:id])
    @violation.destroy

    respond_to do |format|
      format.html { redirect_to(violations_url) }
      format.xml  { head :ok }
    end
  end
end
