class TimerSerializer
  include JSONAPI::Serializer

  attributes :user_id, :name, :duration, :substance, :dosage, :entry_instructions, :notes, :address
end