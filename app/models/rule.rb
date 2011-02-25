class Rule < BasePublicMessage
  validates_uniqueness_of :doc_no,:message => "文件号已存在"
  validates_presence_of :doc_no,:message => "文件号不可为空"
  #生成文件号
  def self.gen_doc_no(org_id)
    doc_sequence = self.org_id_eq(org_id).count + 1
    doc_no = "#{Date.today.year}#{Org.find(org_id).name.first}(#{doc_sequence})"
    doc_no
  end

end
