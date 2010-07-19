class CreateDelivers < ActiveRecord::Migration
  def self.up
    create_table :delivers do |t|
      t.date :deliver_date
      t.string :deliver_name,:null => false,:limit => 30
      t.string :identify_type,:limit => 30
      t.string :identify_no,:limit => 30
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :delivers
  end
end
