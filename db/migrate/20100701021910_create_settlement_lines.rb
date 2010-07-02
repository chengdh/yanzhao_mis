class CreateSettlementLines < ActiveRecord::Migration
  def self.up
    create_table :settlement_lines do |t|
      t.references :settlement,:null => false
      t.string :type,:null => false,:limit => 20
      t.string :name,:null => false,:limit => 60
      t.decimal :value,:default => 0, :precision => 15,:scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :settlement_lines
  end
end
