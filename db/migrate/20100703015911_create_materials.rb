class CreateMaterials < ActiveRecord::Migration
  def self.up
    create_table :materials do |t|
      t.string :name,:null => false,:limit => 60
      t.boolean :is_active,:null => false,:default => true
      t.string :description,:limit => 60
      t.string :type,:null => false,:limit => 30,:default => "Material"
      t.integer :min_count,:default => 0
      t.string :unit,:limit => 10,:default => "个",:null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :materials
  end
end
