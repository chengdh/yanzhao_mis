class AddIsSubCompanyToOrg < ActiveRecord::Migration
  def self.up
    #是否分公司
    add_column :orgs, :is_sub_company, :boolean,:default => false
  end

  def self.down
    remove_column :orgs, :is_sub_company
  end
end
