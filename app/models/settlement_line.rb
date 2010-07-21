class SettlementLine < ActiveRecord::Base
  belongs_to :settlement
  validates_presence_of :name,:message => "项目名称不可为空"
  validates_presence_of :value,:message => "金额不可为空"
  validates_numericality_of :value,:message => "金额应为数字"
end
