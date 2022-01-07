require 'rails_helper'

RSpec.describe Contact do
  describe 'validations' do
    it { validate_presence_of :name }
    it { validate_presence_of :phone_number }
  end
end