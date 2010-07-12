class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :name,:null => false,:limit => 60
      t.string  :logo_file_name
      t.string  :logo_content_type
      t.integer  :logo_file_size
      t.datetime  :logo_updated_at
      t.timestamps

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
