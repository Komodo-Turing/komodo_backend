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
end 
