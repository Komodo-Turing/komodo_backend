FactoryBot.define do 
  factory :contact do 
    user_id { Faker::Number.number(digits: 2) }
    name { Faker::Name.name }
    phone_number { Faker::PhoneNumber.cell_phone }
  end
end 