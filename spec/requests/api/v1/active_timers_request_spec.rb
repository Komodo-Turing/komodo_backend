require 'rails_helper'

RSpec.describe 'Active Timer API' do
  describe 'PATCH /api/v1/timers/:id' do
    let!(:active_timer) { create(:active_timer, user_id: 1, id: 1) }
    
    active_timer_params = { name: "New Name" }
    headers = {"CONTENT_TYPE" => "application/json"}


    before { patch '/api/v1/active_timers/1', headers: headers, params: JSON.generate(active_timer: active_timer_params) }
    
    it 'should update the timer' do
      expect(response).to be_successful

      active_timer.reload
      expect(active_timer.name).to eq 'New Name'
    end
  end

  describe 'POST /api/v1/timers' do
    it 'should create a new Timer if the params are correct' do
      active_timer_params = { 
        id: 19,
        user_id: 1,
        name: 'Timer',
        duration: 120,
        start_time: DateTime.now,
        substance: 'Drug',
        dosage: '10oz',
        entry_instructions: 'The building code is 1234',
        notes: 'These are some notes',
        status: 'Active'
      }
  
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/active_timers', headers: headers, params: JSON.generate(active_timer: active_timer_params)

      active_timer = ActiveTimer.last

      expect(active_timer.user_id).to eq 1
      expect(active_timer.name).to eq 'Timer'
      expect(active_timer.duration).to eq 120
      expect(active_timer.substance).to eq 'Drug'
      expect(active_timer.dosage).to eq '10oz'
      expect(active_timer.entry_instructions).to eq 'The building code is 1234'
      expect(active_timer.notes).to eq 'These are some notes'
      expect(active_timer.status).to eq 'Active'
    end
  end
end