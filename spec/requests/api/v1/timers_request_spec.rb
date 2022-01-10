require 'rails_helper'

RSpec.describe 'Timers API' do
  describe 'GET /api/v1/timers' do
    context 'user exists' do
      describe 'All contacts belong to same user' do
        let!(:timers) { create_list(:timer, 3, user_id: 1) }

        before { get '/api/v1/timers/?user_id=1' }

        it 'returns all timers' do
          expect(response).to be_successful

          timer_list = JSON.parse(response.body, symbolize_names: :true)[:data]

          expect(timer_list).not_to be_empty
          expect(timer_list.count).to eq(3)

          timer_list.each do |timer|
            expect(timer[:attributes]).to have_key(:user_id)
            expect(timer[:attributes][:user_id]).to be_an(Integer)

            expect(timer[:attributes]).to have_key(:name)
            expect(timer[:attributes][:name]).to be_a(String)

            expect(timer[:attributes]).to have_key(:duration)
            expect(timer[:attributes][:duration]).to be_a(Integer)

            expect(timer[:attributes]).to have_key(:substance)
            expect(timer[:attributes][:substance]).to be_a(String)

            expect(timer[:attributes]).to have_key(:dosage)
            expect(timer[:attributes][:dosage]).to be_a(String)

            expect(timer[:attributes]).to have_key(:entry_instructions)
            expect(timer[:attributes][:entry_instructions]).to be_a(String)

            expect(timer[:attributes]).to have_key(:notes)
            expect(timer[:attributes][:notes]).to be_a(String)
          end
        end

        it 'returns status code 200' do
          expect(response).to have_http_status(200)
        end
      end
    end

    describe 'user has no timers' do
      before { get '/api/v1/timers?user_id=10' }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"data\":[]}")
      end
    end

    describe 'Contacts belong to different users' do
      let!(:timer1) { create(:timer, user_id: 1) }
      let!(:timer2) { create(:timer, user_id: 1) }
      let!(:timer3) { create(:timer, user_id: 2) }

      before { get '/api/v1/timers?user_id=2' }

      it 'only retruns the contacts of the specified user' do
        expect(response).to be_successful

        timer_list = JSON.parse(response.body, symbolize_names: :true)[:data]

        expect(timer_list).not_to be_empty
        expect(timer_list.count).to eq(1)
      end
    end
  end

  describe 'GET /api/v1/timers/:id' do
    let!(:timer1) { create(:timer, user_id: 1, id: 1) }
    let!(:timer2) { create(:timer, user_id: 1, id: 2) }

    before { get '/api/v1/timers/1'}

    it 'only returns the timer that is specified' do
      expect(response).to be_successful

      timer = JSON.parse(response.body, symbolize_names: :true)

      expect(timer.count).to eq 1
      expect(timer[:data][:id]).to eq('1')
    end
  end

  describe 'PATCH /api/v1/timers/:id' do
    let!(:timer1) { create(:timer, user_id: 1, id: 1) }

    timer_params = { name: "New Name" }
    headers = {"CONTENT_TYPE" => "application/json"}


    before { patch '/api/v1/timers/1', headers: headers, params: JSON.generate(timer: timer_params) }

    it 'should update the timer' do
      expect(response).to be_successful

      timer1.reload
      expect(timer1.name).to eq 'New Name'
    end
  end

  describe 'POST /api/v1/timers' do
    it 'should create a new Timer if the params are correct' do
      timer_params = {
        user_id: 1,
        name: 'Timer',
        duration: 120,
        substance: 'Drug',
        dosage: '10oz',
        entry_instructions: 'The building code is 1234',
        notes: 'These are some notes'
      }

      #translated to query params format
      # user_id=1&name=Timer&duration=120&substance=Drug&dosage=10oz&entry_instructions=1234&notes=note

      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/timers', headers: headers, params: JSON.generate(timer: timer_params)

      timer = Timer.last

      expect(timer.user_id).to eq 1
      expect(timer.name).to eq 'Timer'
      expect(timer.duration).to eq 120
      expect(timer.substance).to eq 'Drug'
      expect(timer.dosage).to eq '10oz'
      expect(timer.entry_instructions).to eq 'The building code is 1234'
      expect(timer.notes).to eq 'These are some notes'
    end

    # it 'should not create a timer if the params are not valid' do
    #   timer_params = {
    #     user_id: 1,
    #     name: 'Timer',
    #   }

    #   headers = {"CONTENT_TYPE" => "application/json"}

    #   post '/api/v1/timers', headers: headers, params: JSON.generate(timer: timer_params)

    #   expect(response.status).to be_unsuccessful
    #   expect(response.body).to eq 'Timer could not be created'
    # end
  end

  describe 'DELETE /api/v1/timers/:id' do
    let!(:timer) { create(:timer, id: 1) }

    it 'should delete the specified timer' do
      delete '/api/v1/timers/1'

      expect(response).to be_successful
      expect(Timer.all.count).to eq 0
    end
  end
end
