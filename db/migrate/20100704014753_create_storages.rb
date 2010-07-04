#物品库存表
class CreateStorages < ActiveRecord::Migration
  def self.up
    create_table :m_storages do |t|
      t.references :warehouse,:null => false
      t.references :material,:null => false
      t.decimal :avg_price,:default => 0
      t.integer :qty,:default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :m_storages
  end
end
