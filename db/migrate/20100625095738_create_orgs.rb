class CreateOrgs < ActiveRecord::Migration
  def self.up
    create_table :orgs do |t|
      t.string :name,:null => false,:limit => 60
      #部门负责人
      t.references :user
      t.boolean :is_active,:null => false ,:default => true
      t.string :address,:limit => 100
      t.string :phone,:limit => 30

      t.timestamps
    end
  end

  def self.down
    drop_table :orgs
  end
end
