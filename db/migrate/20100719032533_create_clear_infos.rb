class CreateClearInfos < ActiveRecord::Migration
  def self.up
    create_table :clear_infos do |t|
      t.date :clear_date
      t.references :user
      t.text :clear_note


      t.timestamps
    end
  end

  def self.down
    drop_table :clear_infos
  end
end
