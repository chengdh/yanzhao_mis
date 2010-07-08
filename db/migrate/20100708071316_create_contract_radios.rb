#合同模板中的始发货返程货的比例
class CreateContractRadios < ActiveRecord::Migration
  def self.up
    create_table :contract_radios do |t|
      t.references :contract,:null => false
      t.string :mth,:null => false
      t.decimal :start_radio,:precision => 10,:scale => 2,:default => 50
      t.decimal :back_radio,:precision => 10,:scale => 2,:default => 50

      t.timestamps
    end
  end

  def self.down
    drop_table :contract_radios
  end
end
