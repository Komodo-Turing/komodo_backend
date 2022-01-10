FactoryBot.define do 
  factory :active_timer do 
    user_id { Faker::Number.number(digits: 2) }
    name { Faker::Name.name }
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    duration { Faker::Lorem.sentence(word_count: 3) }
    substance { Faker::Lorem.sentence(word_count: 2) }
    dosage { Faker::Lorem.sentence(word_count: 2) }
    entry_instructions { Faker::Lorem.sentence(word_count: 10) }
    notes { Faker::Lorem.sentence(word_count: 11) }
    status { Faker::Lorem.sentence(word_count: 1) }
  end
end 