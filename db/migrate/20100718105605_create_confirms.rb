class CreateConfirms < ActiveRecord::Migration
  def self.up
    create_table :confirms do |t|
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :confirms
  end
end
