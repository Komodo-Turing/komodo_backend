class ActiveTimer < ApplicationRecord
  def create_body(substance, dosage, entry_instructions, notes, address, image_url)
    'You are recieving this text, because (insert name here) did not respond to a timer and may be experiencing an overdose. \n' + 'Substance: ' + substance + '\n' + 'Dosage: ' + dosage + '\n' + Address: ' + address' + '\n' + 'Entry Instructions: ' + entry_instructions + '\n' + 'Notes: ' + notes 
  end 
end