class AddLevelToUser < ActiveRecord::Migration
  def self.up
    #用户级别,0 董事长 1 总经理 3 部门经理 4 普通员工
    add_column :users, :level, :integer,:default => 4
  end

  def self.down
    remove_column :users, :level
  end
end
