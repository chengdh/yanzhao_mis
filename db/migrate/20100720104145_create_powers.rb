class CreatePowers < ActiveRecord::Migration
  def self.up
    create_table :powers do |t|
      t.references :user,:null => false
      t.references :system_function,:null => false
      t.boolean :is_select,:null => false,:default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :powers
  end
end
