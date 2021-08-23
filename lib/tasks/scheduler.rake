namespace :send_message do

    desc "SEND MESSAGE TO MEMBERS"
    task sermon_link: :environment do
      sms_list_hash = Member.get_all_valid_numbers
      "=========== STARTING NUMBER = #{sms_list_hash.count} ============= "
      threads = []
      sms_list_hash.each do |member|
        threads << Thread.new do   
          SendTodaysMessageLinkJob.perform_later(member[:name], member[:number])
        end
      end
      "=========== TOTAL NUMBER TO RUN = #{threads.count} ============="
      threads.map(&:join)
    end

    desc "DEBUG MESSAGE TO MEMBERS"
    task test: :environment do
      sms_list_hash = Member.get_all_valid_numbers
      "=========== STARTING NUMBER = #{sms_list_hash.count} ============= "
      threads = []
      sms_list_hash.each do |member|
        threads << Thread.new do   
          SendSmsTestJob.perform_later(member[:name], member[:number])
        end
      end
    "=========== TOTAL NUMBER TO RUN = #{threads.count} ============="
    threads.map(&:join)
    end
end
  