class MaterialInout < ActiveRecord::Base
  belongs_to :org
  belongs_to :warehouse
  has_many :material_inout_lines,:dependent => :destroy
  accepts_nested_attributes_for :material_inout_lines,:allow_destroy => true ,:reject_if => lambda{|attributes| attributes['material_id'].blank?}
end
