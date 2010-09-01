module ContractsHelper
  #判断合同明细是否可修改,如有对应月份的结算表
  #则对应月份的合同明细不可修改
  def can_edit_item?(org_id,mth)
    !Settlement.exists?(:org_id => org_id,:mth => mth)
  end
  #判断合同是否可以删除,有结算表的合同不可删除
  def contract_can_delete?(contract)
    #根据合同起始及结束日期得到起始及结束月份
    from_mth = contract.date_from.strftime('%Y%m')
    to_mth = contract.date_to.strftime('%Y%m')
    !Settlement.exists?(["org_id = ? AND mth >= ? AND mth <= ?",contract.org_id,from_mth,to_mth])
  end
end
