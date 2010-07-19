class CreateTkInfos < ActiveRecord::Migration
  def self.up
    create_table :tk_infos do |t|
      t.string :tker_name,:limit => 30,:null => false
      t.date :tk_date,:null => false
      t.string :identify_type,:limit => 30
      t.string :identify_no,:limit => 30
      t.string :note,:limit => 300
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :tk_infos
  end
end
