class Client < ActiveRecord::Base
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "50x50>" }
  #机构和用户
  def admin
    User.new(:is_admin => true)
  end
  
  def orgs
    [Org.new,Org.new]
  end

  def admin_attributes=(attributes)
    User.create(attributes)
  end
  def orgs_attributes=(attributes)
    attributes.values.each do |attrs|
      Org.create(attrs)
    end
  end

end
