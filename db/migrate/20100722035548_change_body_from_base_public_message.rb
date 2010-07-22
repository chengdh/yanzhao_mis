class ChangeBodyFromBasePublicMessage < ActiveRecord::Migration
  def self.up
    change_column :base_public_messages,:body,:text,:limit => 6000
  end

  def self.down
    change_column :base_public_messages,:body,:string,:limit => 300
  end
end
