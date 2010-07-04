class CreateMaterialInoutLines < ActiveRecord::Migration
  def self.up
    create_table :material_inout_lines do |t|
      t.references :material_inout,:null => false
      t.references :material,:null => false
      t.string :type,:null => false,:limit => 30
      t.integer :qty,:default => 1
      t.decimal :price,:default => 0,:precision => 10,:scale => 2
      t.decimal :line_amt,:default => 0,:precision => 10,:scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :material_inout_lines
  end
end
