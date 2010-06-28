class AddOrgIdToUser < ActiveRecord::Migration
  def self.up
    #用户所属的机构
    add_column :users, :org_id, :integer
  end

  def self.down
    remove_column :users, :org_id
  end
end
