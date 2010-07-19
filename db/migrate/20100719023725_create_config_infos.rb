class CreateConfigInfos < ActiveRecord::Migration
  def self.up
    create_table :config_infos do |t|
      t.string :config_key,:limit => 60,:null => false
      t.string :config_value,:limit => 60
      t.decimal :config_num_from,:default => 0 ,:precision => 10,:scale => 2
      t.decimal :config_num_to,:default => 0 ,:precision => 10,:scale => 2
      t.date :config_date_from
      t.date :config_date_to
      t.decimal :config_value_num,:default => 0 ,:precision => 10,:scale => 2


      t.timestamps
    end
  end

  def self.down
    drop_table :config_infos
  end
end
