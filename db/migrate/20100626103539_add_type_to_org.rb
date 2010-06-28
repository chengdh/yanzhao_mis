class AddTypeToOrg < ActiveRecord::Migration
  def self.up
    add_column :orgs, :type, :string,:limit => 20
  end

  def self.down
    remove_column :orgs, :type
  end
end
