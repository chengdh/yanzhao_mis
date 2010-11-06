class AddStateToMaterialInout < ActiveRecord::Migration
  def self.up
    add_column :material_inouts, :state, :string,:limit => 10,:default => 'DR'  #出入库单据状态
    add_column :material_inouts, :auditor_id, :integer  #票据审核人
    add_column :material_inouts, :confirm_id, :integer  #票据确认资料
  end

  def self.down
    remove_column :material_inouts, :confirm_id
    remove_column :material_inouts, :auditor_id
    remove_column :material_inouts, :state
  end
end
