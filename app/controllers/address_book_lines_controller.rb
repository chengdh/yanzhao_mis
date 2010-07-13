class AddressBookLinesController < BaseController
  def index
    @address_book_lines = @search.all(:order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.js   { render :partial => "index"}
      format.xml  { render :xml => @address_book_lines }
    end
  end
end
