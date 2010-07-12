class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.rememberable
      t.boolean :is_active,:null => false,:default => true
      t.string :username,:null => false,:limit => 30
      t.references :org
      t.boolean :is_admin,:null => false,:default => false
      # t.lockable

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
