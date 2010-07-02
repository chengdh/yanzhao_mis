#合同细则项目
class CreateContractItems < ActiveRecord::Migration
  def self.up
    create_table :contract_items do |t|
      t.string :name,:null => false,:limit => 60
      t.boolean :is_active,:null => false,:default => true
      t.string :type,:null => false,:limit => 20
      t.decimal :value,:default => 0,:precision => 10,:scale => 2
      t.references :contract,:null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :contract_items
  end
end
