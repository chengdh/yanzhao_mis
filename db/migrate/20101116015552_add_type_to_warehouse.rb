class AddTypeToWarehouse < ActiveRecord::Migration
  def self.up
    add_column :warehouses, :warehouse_type, :string,:limit => 20
  end

  def self.down
    remove_column :warehouses, :warehouse_type
  end
end
