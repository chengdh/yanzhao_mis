#通讯录
class CreateAddressBooks < ActiveRecord::Migration
  def self.up
    create_table :address_books do |t|
      t.string :name,:null => false, :limit => 60
      t.references :org,:null => false
      t.references :user
      t.boolean :is_active,:null => false,:default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :address_books
  end
end
