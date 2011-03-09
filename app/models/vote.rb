class Vote < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  has_many :vote_lines
  accepts_nested_attributes_for :vote_lines
  #根据月份和当前机构生成投票表
  def self.new_with_mth_org(mth,cur_org)
    vote = Vote.new(:mth => mth,:org => cur_org)
    #循环构造vote_lines
    Org.is_active_eq(true).id_ne(cur_org).ascend_by_type.each do |org|
      vote_line = VoteLine.new(:org => org,:vote => vote,:vote_value => 0)
      vote.vote_lines << vote_line
    end
    vote
  end
  #计算给定月份,给定机构的不同类型投票数量
  #返回数组[给定值投票人,全部值投票人]
  #vote_value -1 差
  #vote_value  0 一般
  #vote_value  1 优
  def self.cal_vote(mth,org,vote_value)
    spec_votes = VoteLine.search(:vote_mth_eq => mth,:org_id_eq => org.id,:vote_value_eq => vote_value).sum(1)
    all_votes = VoteLine.search(:vote_mth_eq => mth,:org_id_eq => org.id).sum(1)
    #pecent_votes = "#{(spec_votes/all_votes)*100}&#37;"
    [spec_votes,all_votes]
  end
  #导出投票结果
  def to_csv
    ret = ["月份:",self.mth].export_line_csv(true)

    Org.is_active_eq(true).ascend_by_type.each do |org|
      vote_ok = Vote.cal_vote(self.mth,org,1)
      vote_normal = Vote.cal_vote(self.mth,org,0)
      vote_bad = Vote.cal_vote(self.mth,org,-1)
      ret += [org.name,"优:#{vote_ok[0]}/#{vote_ok[1]}","一般:#{vote_normal[0]}/#{vote_normal[1]}","差:#{vote_bad[0]}/#{vote_bad[1]}"].export_line_csv
    end
    ret
  end
end
