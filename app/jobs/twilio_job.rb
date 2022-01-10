class TwilioJob < ApplicationJob
  queue_as :default

  def perform(to_number, body)
    TwilioService.send_message(to_number, body)
  end
end
