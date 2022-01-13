class Contact < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :phone_number, phone: { possible: true, allow_blank: false }, uniqueness: false
  before_save :format_phone

  def format_phone
    self.phone_number = Phonelib.parse(phone_number).e164
  end
end
