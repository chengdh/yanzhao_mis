class AddAlertToContract < ActiveRecord::Migration
  #添加合同三个月到期报警标志 false 报警未处理 true 报警已处理
  def self.up
    add_column :contracts, :alert, :boolean,:default => false
  end

  def self.down
    remove_column :contracts, :alert
  end
end
