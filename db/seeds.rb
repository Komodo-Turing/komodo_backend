# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'factory_bot_rails'

# FactoryBot.create_list(:contact, 5, user_id: 1)
# FactoryBot.create_list(:contact, 2, user_id: 2)

Contact.create(user_id: 1, name: 'contact1', phone_number: '111-111-1111')
Contact.create(user_id: 1, name: 'contact2', phone_number: '222-222-2222')
Contact.create(user_id: 1, name: 'contact3', phone_number: '333-333-3333')

Contact.create(user_id: 2, name: 'contact4', phone_number: '444-444-4444')
Contact.create(user_id: 2, name: 'contact5', phone_number: '555-555-5555')
Contact.create(user_id: 2, name: 'contact6', phone_number: '777-777-7777')