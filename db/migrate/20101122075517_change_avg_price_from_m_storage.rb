class ChangeAvgPriceFromMStorage < ActiveRecord::Migration
  def self.up
    change_column :m_storages,:avg_price,:decimal,:precision => 10,:scale => 2
  end

  def self.down
  end
end
