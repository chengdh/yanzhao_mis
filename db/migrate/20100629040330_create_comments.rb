class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :post
      t.string :body,:null => false,:limit => 600
      t.references :user,:null => false
      t.boolean :is_active,:null => false,:default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
