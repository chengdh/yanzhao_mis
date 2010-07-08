class AddMthToContractItem < ActiveRecord::Migration
  def self.up
    add_column :contract_items, :mth, :string,:limit => 6
  end

  def self.down
    remove_column :contract_items, :mth
  end
end
