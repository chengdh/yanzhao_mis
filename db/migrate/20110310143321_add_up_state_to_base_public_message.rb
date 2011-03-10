class AddUpStateToBasePublicMessage < ActiveRecord::Migration
  def self.up
    #上发状态
    add_column :base_public_messages, :up_state, :boolean,:default => false
  end

  def self.down
    remove_column :base_public_messages, :up_state
  end
end
