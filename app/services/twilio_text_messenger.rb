class TwilioTextMessenger
  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text(contact_phone_number, message, map_image)
    @client.messages.create(
      to: contact_phone_number,
      from: phone_number,
      body: message,
      media_url: [map_image]
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
