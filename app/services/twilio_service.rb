class TwilioService

  def self.send_message(to_number, body)
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], (ENV['TWILIO_AUTH_TOKEN']))
    client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: to_number,
      body: body
      )
  end
  
end
