class SendAnnouncementsToMembersJob < ApplicationJob
  queue_as :default

  def perform(name, number, message)
    client =  WITTLY_FLOW_CLIENT
    message = "Hi #{name}, #{message}"
    res = client.send_sms("A.G.B.A", number, message)
    puts "============ SENDING SMS TO #{name} ON #{number} SMS LOGS: #{message} ====================="
    puts "============ SMS LOGS: #{res} ====================="
  end
end
