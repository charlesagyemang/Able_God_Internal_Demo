class SendTodaysMessageLinkJob < ApplicationJob
  queue_as :default

  def perform(name, number, day="sunday's", by="Bishop Mavis Opoku-Agyemang")
    message = "Dear #{name}, you can find the link to #{day} message [#{Date.yesterday}] by #{by} using the link below \n https://anchor.fm/bishop-moa\n Scroll down to where you see all the audios and click on play to listen. Please share and follow. God bless you and have a great week dear."
    client =  WITTLY_FLOW_CLIENT
    res = client.send_sms("A.G.B.A", number, message)
    puts "============ SENDING SMS TO #{name} ON #{number} SMS LOGS: #{message} ====================="
    puts "============ SMS LOGS: #{res} ====================="
  end
end
