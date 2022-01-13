require 'rails_helper'

RSpec.describe 'Merchants API', type: :request do
  describe 'GET /api/v1/contacts' do
    context 'user exists' do
      describe 'All contacts belong to same user' do
        let!(:contacts) { create_list(:contact, 3, user_id: 4) }

        before { get '/api/v1/contacts/?user_id=4' }

        it 'returns contacts' do
          #add so contacts have user id of 3 and check that contacts are only returned for user id of 4
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

    describe 'user has no contacts' do
      before { get '/api/v1/contacts?user_id=10' }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a not found message' do
        expect(response.body).to match("{\"data\":[]}")
      end
    end

    describe 'Contacts belong to different users' do
      let!(:contact1) { create(:contact, user_id: 1) }
      let!(:contact2) { create(:contact, user_id: 1) }
      let!(:contact1) { create(:contact, user_id: 2) }

      before { get '/api/v1/contacts?user_id=2' }

      it 'only retruns the contacts of the specified user' do
        expect(response).to be_successful

        contacts_list = JSON.parse(response.body, symbolize_names: :true)[:data]

        expect(contacts_list).not_to be_empty
        expect(contacts_list.count).to eq(1)
      end
    end
  end

  describe 'PATCH /api/v1/contacts' do
    let!(:contacts) { create_list(:contact, 3) }
    let!(:contact_id) { contacts.first.id }

    before { patch "/api/v1/contacts/#{contact_id}?phone_number=1112223333" }

    context 'when the record exists' do
      it 'updates the record' do
        expect(response.body).to_not be_empty
        expect(Contact.find(contact_id).phone_number).to eq('1112223333')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST /api/v1/contacts' do
    context 'when the request is valid' do
      before { post "/api/v1/contacts/?name=John+Smith&phone_number=1112223333&user_id=5" }
      it 'creates a contact' do
        contact = JSON.parse(response.body, symbolize_names: :true)[:data]

        expect(contact[:attributes][:user_id]).to eq(5)
        expect(contact[:attributes][:name]).to eq('John Smith')
        expect(contact[:attributes][:phone_number]).to eq('1112223333')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post "/api/v1/contacts/?phone_number=1112223333&user_id=5" }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'DELETE /api/v1/contacts' do
    let!(:contacts) { create_list(:contact, 3) }
    let!(:contact_id) { contacts.first.id }

    before { delete "/api/v1/contacts/#{contact_id}" }

    it 'successfully deletes the contact' do
      expect(response).to have_http_status(200)
      expect(Contact.count).to eq(2)
    end
  end
end
