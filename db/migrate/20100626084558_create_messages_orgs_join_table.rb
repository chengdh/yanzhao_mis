#公告/机构联合表
class CreateMessagesOrgsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :base_public_messages_orgs,:id => false do |t|
      t.integer :base_public_message_id
      t.integer :org_id
    end
  end

  def self.down
    drop_table :base_public_messages_orgs
  end
end
