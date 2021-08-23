class SendTodaysMessageLinkJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Send Sermon Link To Customers"
    puts Member.get_all_valid_numbers
  end
end
