class SendTodaysMessageLinkJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "lets send the message koraa"
  end
end
