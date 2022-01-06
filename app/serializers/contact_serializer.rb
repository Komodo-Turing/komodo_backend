class ContactSerializer 
  include JSONAPI::Serializer 

  attributes :user_id, :name, :phone_number
end 