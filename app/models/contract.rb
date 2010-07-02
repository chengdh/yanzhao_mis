class Contract < ActiveRecord::Base
  belongs_to :org
  has_many :fixed_subsidies,:dependent => :destroy
  has_many :fixed_deductions,:dependent => :destroy
  has_many :unfixed_deductions,:dependent => :destroy
  has_many :unfixed_subsidies,:dependent => :destroy
  has_many :other_deductions,:dependent => :destroy
  accepts_nested_attributes_for :fixed_subsidies,:fixed_deductions,:unfixed_deductions,:unfixed_subsidies,:other_deductions,:allow_destroy => true ,:reject_if => lambda{|attributes| attributes['name'].blank?}
end
