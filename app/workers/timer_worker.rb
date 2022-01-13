class TimerWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(timer_id, user_id, duration, body)
    duration.downto(0) do |i|
      puts "00:00:#{'%02d' % i}"
      sleep 1
    end
    checker(timer_id, user_id, body) 
  end

  def checker(timer_id, user_id, body) 
    send_message(user_id, body) if ActiveTimer.find(timer_id).status == 'Active' 
  end

  def send_message(user_id, body) 
    contact = Contact.find_by(user_id: user_id)
    TwilioTextMessenger.new.send_text(contact.phone_number, body) 
    ActiveTimer.find(timer_id).status = 'complete'
  end
end
