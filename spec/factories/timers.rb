FactoryBot.define do 
  factory :timer do 
    user_id { Faker::Number.number(digits: 2) }
    name { Faker::Name.name }
    duration { Faker::Lorem.sentence(word_count: 3) }
    substance { Faker::Lorem.sentence(word_count: 2) }
    dosage { Faker::Lorem.sentence(word_count: 2) }
    entry_instructions { Faker::Lorem.sentence(word_count: 10) }
    notes { Faker::Lorem.sentence(word_count: 11) }
  end
end 