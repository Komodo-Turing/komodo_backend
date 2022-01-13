class TwilioTextMessenger
  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new account_sid, auth_token
  end 

  def send_text(contact_phone_number, message, address)
    @client.messages.create(
      to: contact_phone_number,
      from: phone_number,
      body: message
      #media_url: ['https://maps.googleapis.com/maps/api/streetview?location=4835%20irving%20st,%20denver,%20co%2080221&size=600x1000&key=AIzaSyBbOSmRFIR-SdFOYoehsAot6Kk9eWbK3YI']
    )
  end 

  private 

  def account_sid
    ENV['twilio_sid']
  end 

  def auth_token
    ENV['twilio_auth_token']
  end 

  def phone_number 
    ENV['twilio_phone_num']
  end 
end