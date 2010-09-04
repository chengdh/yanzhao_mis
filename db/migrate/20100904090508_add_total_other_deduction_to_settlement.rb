class AddTotalOtherDeductionToSettlement < ActiveRecord::Migration
  def self.up
    add_column :settlements, :total_other_deduction, :decimal,:precision => 15,:scale => 2
  end

  def self.down
    remove_column :settlements, :total_other_deduction
  end
end
