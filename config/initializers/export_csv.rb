#为Array类添加导出csv方法
class Array
  def export_csv(options ={})
    #参考http://blog.enjoyrails.com/2008/12/12/rails-导入导出csv数据时的中文编码问题/
    #BOM头信息
    bom = "FFFE".gsub(/\s/,'').to_a.pack("H*")
    bom + self.to_csv(options).utf8_to_utf16
  end
  #将数组中的数据导出为一行
  def export_line_csv
    output = FasterCSV.generate(:col_sep => "\t", :row_sep => "\r\n")do |csv|
      csv << self
    end
    output.utf8_to_utf16
  end

end
