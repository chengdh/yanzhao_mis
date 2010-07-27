class ClientsController < BaseController
  skip_before_filter :authenticate_user!,:only => [:new,:create]
  skip_before_filter :filter_init,:only => [:new,:create]
  before_filter :check_init_completed,:only => [:new,:create]

  # GET /clients/new
  # GET /clients/new.xml
  def new
    @client = Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
    respond_to do |format|
      format.html   { render :edit,:layout => "application"} 
    end
  end

  # POST /clients
  # POST /clients.xml
  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        flash[:notice] = '注册信息创建成功.'
        format.html { redirect_to :root }
        format.xml  { render :xml => @client, :status => :created, :location => @client }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.xml
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        flash[:notice] = '注册信息更新成功.'
        format.html { render :edit ,:layout => "application" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit",:layout => "application" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end
  private
  #检验是否已注册
  def check_init_completed
    if Client.count > 0 
      redirect_to :root
    end
  end
end
