class ContractRadio < ActiveRecord::Base
  belongs_to :contract
  validates_numericality_of :start_radio,  :message => "比例应为数字"
  validates_numericality_of :back_radio,  :message => "比例应为数字"
end
