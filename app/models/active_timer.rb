class ActiveTimer < ApplicationRecord
  def create_body(substance, dosage, entry_instructions, notes, address, image_url)
    notes + ' ' + address + ' ' + image_url 
  end 
end