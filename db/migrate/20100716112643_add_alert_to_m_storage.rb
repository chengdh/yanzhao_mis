class AddAlertToMStorage < ActiveRecord::Migration
  def self.up
    #库存预警标志
    add_column :m_storages, :alert, :boolean,:default => false
  end

  def self.down
    remove_column :m_storages, :alert
  end
end
