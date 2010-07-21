class ScrappedInfo < MaterialInout
  def before_save
    #将数量设置为负数
    self.material_inout_lines.each do |line|
      line.qty = 0 - line.qty  if line.qty > 0
    end
  end
end
