#通告、规章制度查看信息
class CreateMessageVisitors < ActiveRecord::Migration
  def self.up
    create_table :message_visitors do |t|
      t.integer :base_public_message_id,:null => false
      t.references :user,:null => false
      t.datetime :visited_at
      t.string :note,:limit => 200
      t.string :state,:limit => 10

      t.timestamps
    end
  end

  def self.down
    drop_table :message_visitors
  end
end
