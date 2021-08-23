namespace :send_message do

    desc "SEND MESSAGE TO MEMBERS"
    task sermon_link: :environment do
      sms_list_hash = Member.get_all_valid_numbers
      threads = []
      sms_list_hash.each do |member|
        threads << Thread.new do   
          SendTodaysMessageLinkJob.perform_later(member[:name], member[:number])
        end
      end
      threads.map(&:join)
    end

    desc "TEST SEND SMS"
    task test: :environment do
       SendSmsTestJob.perform_later
    end

end
  