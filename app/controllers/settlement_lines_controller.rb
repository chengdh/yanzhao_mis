class SettlementLinesController < BaseController
  def index
    @settlement_lines = @search.paginate :page => params[:page],:order => "name,created_at DESC"
    #@group_settlement_lines = @settlement_lines.group_by {|line| line.settlement.org.name}
    @sum = @search.sum(:value)
  end


end
