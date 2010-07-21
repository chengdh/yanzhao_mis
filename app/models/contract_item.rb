class ContractItem < ActiveRecord::Base
  belongs_to :contract
  validates_presence_of :name,:message => "名称不可为空"
  validates_numericality_of :value, :message => "金额应为数字"
end
