class ChangeMaterialInoutWarehouseId < ActiveRecord::Migration
  def self.up
    change_column :material_inouts,:warehouse_id,:integer,:null => true
  end

  def self.down
  end
end
