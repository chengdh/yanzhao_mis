class AddUserIdToConfigInfo < ActiveRecord::Migration
  def self.up
    add_column :config_infos, :user_id, :integer
  end

  def self.down
    remove_column :config_infos, :user_id
  end
end
