class AddressBookLinesController < BaseController
  def index
    @address_book_lines = @search.paginate :page => params[:page],:order => "created_at DESC"
    @group_address_book_lines=@address_book_lines.group_by {|line| line.address_book}


    respond_to do |format|
      format.html # index.html.erb
      format.js   { render :partial => "index"}
      format.xml  { render :xml => @address_book_lines }
    end
  end
end
