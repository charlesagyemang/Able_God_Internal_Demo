class NotifyMembersJob < ApplicationJob
  queue_as :default

  def perform(name, number, day="SUNDAY")
    sunday_message = "Hi #{name}, its another sunday and we thank God for Life. Please do well to make it to todays service between 9:00 and 11:30 am. It will be powerful. I will be expecting to see you #{name}. God bless you as you come. See you"
    thursday_message = "Hey #{name}, this is Bishop, I hope I caught you at the right time. I wanted to remind you that today is Power Thursday. We will be holding a very powerful prayer session between 9:00 and 12:00 at the church premises. If you have time on your hands please do well to pass by. If you can't make it, you can send in your prayer requests and we will remind you in prayers. Have a nice day #{name}. See you!"
    client =  WITTLY_FLOW_CLIENT
    message = ""

    day == "SUNDAY" ? message = sunday_message : message = thursday_message
    res = client.send_sms("A.G.B.A", number, message)

    puts "============ SENDING SMS TO #{name} ON #{number} SMS LOGS: #{message} ====================="
    puts "============ SMS LOGS: #{res} ====================="
  end
end
