class CreateContracts < ActiveRecord::Migration
  def self.up
    create_table :contracts do |t|
      t.references :org
      t.date :date_from
      t.date :date_to
      t.decimal :radio_start
      t.decimal :radio_back
      t.string :note

      t.timestamps
    end
  end

  def self.down
    drop_table :contracts
  end
end
