class TimerWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(timer_id, user_id, duration, message)
    duration.downto(0) do |i|
      puts "00:00:#{'%02d' % i}"
      sleep 1
    end
    checker(timer_id, user_id, message)
  end

  def checker(timer_id, user_id, message)
    send_message(user_id, message) if ActiveTimer.find(timer_id).status == 'Active'
  end 

  def send_message(user_id, message)
    contact = Contact.find_by(user_id: user_id)
    TwilioTextMessenger.new.send_text(contact.phone_number, message)
    ActiveTimer.find(timer_id).status = 'complete'
  end 
end
