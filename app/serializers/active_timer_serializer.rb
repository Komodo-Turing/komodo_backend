class ActiveTimerSerializer
  include JSONAPI::Serializer 

  attributes :user_id, :name, :start_time, :duration, :substance, :dosage, :entry_instructions, :notes, :status, :address
end
