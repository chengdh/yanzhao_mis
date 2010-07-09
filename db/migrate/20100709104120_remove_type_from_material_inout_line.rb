class RemoveTypeFromMaterialInoutLine < ActiveRecord::Migration
  def self.up
    remove_column :material_inout_lines,:type
  end

  def self.down
    add_column :material_inout_lines,:type,:string,:limit => 30,:null => false
  end
end
