class AddressBook < ActiveRecord::Base
  belongs_to :org
  belongs_to :user
  has_many :address_book_lines,:dependent => :destroy
  accepts_nested_attributes_for :address_book_lines,:reject_if => lambda{|attributes| attributes['name'].blank?},:allow_destroy => true
end
