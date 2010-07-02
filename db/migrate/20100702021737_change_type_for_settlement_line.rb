class ChangeTypeForSettlementLine < ActiveRecord::Migration
  def self.up
    change_column :settlement_lines,:type,:string,:limit => 50
  end

  def self.down
    change_column :settlement_lines,:type,:string,:limit => 20
  end
end
