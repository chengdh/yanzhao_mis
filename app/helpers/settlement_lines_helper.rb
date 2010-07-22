module SettlementLinesHelper
  #费用项目明细列表
  def settlement_items_for_select
    SettlementLine.all(:select => "DISTINCT name ",:order => "name").collect { |sl| [sl.name, sl.name] }
  end

end
