require 'rails_helper'

RSpec.describe Contact do
  describe 'validations' do
    it { validate_presence_of :name }
    it { validate_presence_of :phone_number }
  end

  describe 'class methods' do
    it '.format_phone' do
      contact = Contact.create(name: 'Test', phone_number: '(999) 999-9999')
      expect(contact.phone_number).to eq('+19999999999')
    end
  end
end
