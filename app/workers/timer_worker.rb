class TimerWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(timer_id, user_id, duration, body, image_url)
    (duration * 60).downto(0) do |i|
      puts "00:00:#{'%02d' % i}"
      sleep 1
    end
    checker(timer_id, user_id, body, image_url) 
  end

  def checker(timer_id, user_id, body, image_url) 
    send_message(timer_id, user_id, body, image_url) if ActiveTimer.find(timer_id).status == 'Active' 
  end

  def send_message(timer_id, user_id, body, image_url) 
    contact = Contact.find_by(user_id: user_id)
    TwilioTextMessenger.new.send_text(contact.phone_number, body, image_url) 
    ActiveTimer.find(timer_id).status = 'complete'
  end
end
