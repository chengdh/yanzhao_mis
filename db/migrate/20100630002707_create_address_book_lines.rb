class CreateAddressBookLines < ActiveRecord::Migration
  def self.up
    create_table :address_book_lines do |t|
      t.string :name,:null => false,:limit => 60
      t.string :phone,:limit => 30
      t.string :mobile,:limit => 30
      t.boolean :is_active,:null => false,:default => true
      t.references :address_book,:null => false
      t.string :location,:limit => 60
      t.string :note,:limit => 200

      t.timestamps
    end
  end

  def self.down
    drop_table :address_book_lines
  end
end
