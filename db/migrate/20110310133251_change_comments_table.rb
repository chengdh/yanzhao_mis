class ChangeCommentsTable < ActiveRecord::Migration
  def self.up
    remove_column :comments,:post_id
    add_column :comments,:commentable_id,:integer,:null => false
    add_column :comments,:commentable_type,:string,:null => false
  end

  def self.down
    add_column :comments,:post_id,:null => false
    remove_column :comments,:commentable_id
    remove_column :comments,:commentable_type
  end
end
