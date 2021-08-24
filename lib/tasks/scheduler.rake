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
    threads.map(&:join)
    end

    desc "QUOTE OF THE DAY"
    task qod: :environment do

      todays_quote = QuoteOfTheDay.today

      if !todays_quote 
        todays_quote = QuoteOfTheDay.take
      end

      puts "#{todays_quote.quote}"

      sms_list_hash = Member.get_all_valid_numbers
      "=========== STARTING NUMBER = #{sms_list_hash.count} ============= "
      threads = []
      sms_list_hash.each do |member|
        threads << Thread.new do   
          SendQuoteOfTheDayJob.perform_later(member[:name], member[:number], todays_quote.quote)
        end
      end
      threads.map(&:join) 

    end


    desc "SEND BIRTHDAY MESSAGES TO FOLK CELEBRATING TODAY"
    task birthday_message: :environment do
      sms_list_hash = Member.get_todays_birthdays
      
      threads = []
      sms_list_hash.each do |member|
        msg = member.form_birthday_message_today
        threads << Thread.new do   
          puts "======== AYELE ===== #{msg}"
          SendBirthdayMessagesJob.perform_later(member.first_name, member.phone_number, msg)
        end
      end
      threads.map(&:join) 
    end

end
  