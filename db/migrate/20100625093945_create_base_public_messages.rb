#公共信息基础类
class CreateBasePublicMessages < ActiveRecord::Migration
  def self.up
    create_table :base_public_messages do |t|
      t.string :title,:limit => 200,:null => false
      t.string :body,:limit => 500
      t.string :type,:limit => 20
      t.boolean :is_secure,:null => false,:default => false
      t.string :state,:null => false,:limit => 20
      t.references :org
      t.boolean :is_active,:default => true
      t.references :user
      t.datetime :publish_date
      t.integer :publisher_id

      t.timestamps
    end
  end

  def self.down
    drop_table :base_public_messages
  end
end
