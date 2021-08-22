class SendTodaysMessageLinkJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Send Sermon Link To Customers"
  end
end
