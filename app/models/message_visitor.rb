class MessageVisitor < ActiveRecord::Base
  include AASM
  belongs_to :user
  belongs_to :base_public_message

  aasm_column :state
  aasm_initial_state :draft   #初始状态为草稿
  aasm_state :draft,:desc => "草稿"           #草稿
  aasm_state :visited,:enter =>:set_visit_time,:desc => "已查看"       #已确认
  aasm_event :visit do
    transitions :to => :visited,:from => :draft
  end
  private
  def set_visit_time
    self.visited_at = DateTime.now
  end
end
