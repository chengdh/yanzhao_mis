class Settlement < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  has_many :fixed_settlement_line_subsidies,:dependent => :destroy
  has_many :fixed_settlement_line_deductions,:dependent => :destroy
  has_many :unfixed_settlement_line_deductions,:dependent => :destroy
  has_many :unfixed_settlement_line_subsidies,:dependent => :destroy
  has_many :other_settlement_line_deductions,:dependent => :destroy
  accepts_nested_attributes_for :fixed_settlement_line_subsidies,:fixed_settlement_line_deductions,:unfixed_settlement_line_deductions,:unfixed_settlement_line_subsidies,:other_settlement_line_deductions,:allow_destroy => true ,:reject_if => lambda{|attributes| attributes['name'].blank?}
  #根据合同模板生成结算相关项目
  def build_lines(temp)
    #设置比例
    self.start_radio = temp.radio_start
    self.back_radio = temp.radio_back
    temp.fixed_subsidies.each{ |item| self.fixed_settlement_line_subsidies.build(:name => item.name,:value => item.value)}
    temp.fixed_deductions.each{ |item| self.fixed_settlement_line_deductions.build(:name => item.name,:value => item.value)}
    temp.unfixed_deductions.each{ |item| self.unfixed_settlement_line_deductions.build(:name => item.name,:value => item.value)}
    temp.unfixed_subsidies.each{ |item| self.unfixed_settlement_line_subsidies.build(:name => item.name,:value => item.value)}
    temp.other_deductions.each{ |item| self.other_settlement_line_deductions.build(:name => item.name,:value => item.value)}
  end
end
