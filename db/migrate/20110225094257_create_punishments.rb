#处罚记录
class CreatePunishments < ActiveRecord::Migration
  def self.up
    create_table :punishments do |t|
      t.string :title,:limit => 60,:null => false
      t.references :violation  #对应的违规记录
      t.date :punish_date,:null => false #处罚时间
      t.text :content,:null => false
      t.string :handled,:limit => 20,:null => false #经手人
      t.references :user #操作员
      t.integer :target_org_id  #处罚对象/分理处或分公司
      t.string :target #处罚对象,是人员

      t.timestamps
    end
  end

  def self.down
    drop_table :punishments
  end
end
