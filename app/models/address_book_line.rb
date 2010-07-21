class AddressBookLine < ActiveRecord::Base
  belongs_to :address_book
  validates_presence_of :name,:message => "姓名不可为空"
end
