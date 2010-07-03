class CreateWarehouses < ActiveRecord::Migration
  def self.up
    create_table :warehouses do |t|
      t.string :name,:null => false,:limit => 60
      t.boolean :is_active,:null => false,:default => true
      t.string :note,:limit => 200
      t.string :manager,:limit => 30

      t.timestamps
    end
  end

  def self.down
    drop_table :warehouses
  end
end
