namespace :send_message do

    desc "SEND MESSAGE TO MEMBERS"
    task sermon_link: :environment do
      sms_list_hash = Member.get_all_valid_numbers
      sms_list_hash.each do |member|
          SendTodaysMessageLinkJob.perform_later(member[:name], member[:number])
      end
    end

    desc "TEST SEND SMS"
    task test: :environment do
      sms_list_hash = Member.get_all_valid_numbers
      sms_list_hash.each do |member|
          SendSmsTestJob.perform_later(member[:name], member[:number])
      end
    end

end
  