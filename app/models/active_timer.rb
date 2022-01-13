class ActiveTimer < ApplicationRecord
  def create_body(substance, dosage, entry_instructions, notes, address, image_url)
    'You are recieving this text, because (insert name here) did not respond to a timer and may be experiencing an overdose. ' + 'Substance: ' + substance + ' ' + 'Dosage: ' + dosage + ' ' + 'Address: ' + address + ' ' + 'Entry Instructions: ' + entry_instructions + ' ' + 'Notes: ' + notes 
  end 
end