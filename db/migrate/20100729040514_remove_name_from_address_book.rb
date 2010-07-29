class RemoveNameFromAddressBook < ActiveRecord::Migration
  def self.up
    remove_column :address_books,:name
  end

  def self.down
    add_column :address_books,:name,:string,:limit => 30
  end
end
