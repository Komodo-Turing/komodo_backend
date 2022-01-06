require 'rails_helper' 

RSpec.describe 'Merchants API', type: :request do 
  describe 'GET /api/v1/contacts' do 
    context 'user exists' do 
      describe 'All contacts belong to same user' do 
        let!(:contacts) { create_list(:contact, 3, user_id: 4) }

        before { get '/api/v1/contacts?user_id=4' }

        it 'returns contacts' do 
          expect(response).to be_successful

          contacts_list = JSON.parse(response.body, symbolize_names: :true)[:data]

          expect(contacts_list).not_to be_empty
          expect(contacts_list.count).to eq(3)

          contacts_list.each do |contact| 
            expect(contact[:attributes]).to have_key(:user_id)
            expect(contact[:attributes][:user_id]).to be_an(Integer)

            expect(contact[:attributes]).to have_key(:name)
            expect(contact[:attributes][:name]).to be_a(String)

            expect(contact[:attributes]).to have_key(:phone_number)
            expect(contact[:attributes][:phone_number]).to be_a(String)
          end 
        end 

        it 'returns status code 200' do 
          expect(response).to have_http_status(200)
        end 
      end 
    end 

    describe 'user does not exist' do 
      before { get '/api/v1/contacts?user_id=4' }

      it 'returns status code 404' do 
        expect(response).to have_http_status(404)
      end 

      it 'returns a not found message' do 
        expect(response.body).to match(/Couldn't find User/)
      end 
    end 

    # describe 'Contacts belong to different users' do
    #   let!(:contact1) { create(:contact, user_id: 1) }
    #   let!(:contact2) { create(:contact, user_id: 1) }
    #   let!(:contact1) { create(:contact, user_id: 2) }
    # end 
  end 
end 