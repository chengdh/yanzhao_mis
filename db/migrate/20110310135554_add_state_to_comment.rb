class AddStateToComment < ActiveRecord::Migration
  def self.up
    #对回复的评价 1 满意 -1 不满意
    add_column :comments, :state, :string,:default => nil
  end

  def self.down
    remove_column :comments, :state
  end
end
