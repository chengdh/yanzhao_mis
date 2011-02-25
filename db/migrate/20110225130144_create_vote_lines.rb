#投票明细
class CreateVoteLines < ActiveRecord::Migration
  def self.up
    create_table :vote_lines do |t|
      t.references :vote,:null => false
      t.references :org,:null => false
      t.integer :vote_value,:default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :vote_lines
  end
end
