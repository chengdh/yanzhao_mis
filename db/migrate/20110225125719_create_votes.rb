#投票信息
class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.references :org,:null => false
      t.references :user
      t.string :mth,:null => false

      t.timestamps
    end
    add_index :votes,[:org_id,:mth],:unique => true
  end

  def self.down
    drop_table :votes
  end
end
