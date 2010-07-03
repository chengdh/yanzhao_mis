class CreateMaterialInouts < ActiveRecord::Migration
  def self.up
    create_table :material_inouts do |t|
      t.date :inout_date,:null => false
      t.references :org
      t.references :warehouse,:null => false
      t.string :person_name,:limit => 30
      t.string :note,:limit => 200
      t.string :type,:null => false,:limit => 30

      t.timestamps
    end
  end

  def self.down
    drop_table :material_inouts
  end
end
