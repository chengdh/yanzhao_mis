class CreateVipConfigs < ActiveRecord::Migration
  def self.up
    create_table :vip_configs do |t|
      t.references :org,:null => false
      t.string :name,:null => false,:limit => 60
      t.decimal :fee_from,:default => 0,:precision => 15,:scale => 2
      t.decimal :fee_to,:default => 0,:precision => 15,:scale => 2


      t.timestamps
    end
  end

  def self.down
    drop_table :vip_configs
  end
end
