require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many :contacts }
    it { should have_many :timers }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :phone_number }
    it { should validate_presence_of :token }
    it { should validate_presence_of :google_id }
  end
end