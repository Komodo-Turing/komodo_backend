class TwilioTextMessenger
  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text(contact_phone_number, body, image_url)
    @client.messages.create(
      body: body,
      from: phone_number,
      to: contact_phone_number,
      media_url: [image_url]
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
