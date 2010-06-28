class AddDocNoToBasePublicMessage < ActiveRecord::Migration
  def self.up
    add_column :base_public_messages, :doc_no, :string,:limit => 20
  end

  def self.down
    remove_column :base_public_messages, :doc_no
  end
end
