class AddIsActiveToContract < ActiveRecord::Migration
  def self.up
    add_column :contracts, :is_active, :boolean,:null => false,:default => true
  end

  def self.down
    remove_column :contracts, :is_active
  end
end
