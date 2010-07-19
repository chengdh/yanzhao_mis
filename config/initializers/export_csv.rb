#为Array类添加导出csv方法
class Array
  def export_csv(options ={})
    self.to_csv(
      options.merge(
        :methods => [:from_org_name,:to_org_name,:pay_type_des,:state_des],
        :only => [:bill_no,:goods_no,:sender_name,:sender_phone,:receiver_name,:receiver_phone,
          :bill_mth,:fee,:goods_fee,:goods_num,:k_hand_fee,:k_carrying_fee,
          :act_pay_fee,:storage_fee,:clear_fee,:goods_info,:note,:created_at])).utf8_to_utf16

  end
  #将数组中的数据导出为一行
  def export_line_csv
    output = FasterCSV.generate(:col_sep => "\t", :row_sep => "\r\n")do |csv|
        csv << self
    end
    output.utf8_to_utf16
  end

end
