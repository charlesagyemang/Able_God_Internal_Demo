class SendSmsTestJob < ApplicationJob
  queue_as :default

  def perform(*args)
    numbers = ["0507565349", "0500443209"]
    client = WITTLY_FLOW_CLIENT
    res = client.send_sms("A.G.B.A", numbers[0], "First AGBA Message From Heroku Via Jobs")
    puts "============ SENDING TEST SMS LOGS: #{res} ====================="
  end

end
