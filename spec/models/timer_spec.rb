require 'rails_helper'

RSpec.describe Timer do
  describe 'validations' do
    it { validate_presence_of :name }
    it { validate_presence_of :duration }
  end
end