require 'rails_helper'

RSpec.describe Contact do
  describe 'relationships' do
    it { should belong_to :user }
  end

  describe 'validations' do
    it { validate_presence_of :name }
    it { validate_presence_of :phone_number }
  end
end