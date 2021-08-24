class Member < ApplicationRecord

    validates :phone_number, length: { minimum: 10 }
    validates :phone_number, presence: true
    has_many :leaders, dependent: :destroy

    def self.get_all_valid_numbers
        phone_number_arrays = []
        rejected_array = []
        all_members = Member.where.not(phone_number: nil)
        all_members.map  do |member|
            name = member.name.split(" ")[0]
            number = member.phone_number.gsub(" ", "")
            number_starts_with_zero_and_is_ten_digits = number.split("")[0] == "0" && number.length == 10
            if number_starts_with_zero_and_is_ten_digits
                phone_number_arrays.push({name: name, number: number})
            else 
                rejected_array.push({name: name, number: number})
            end
        end
        puts "======= REJECTED ARRAY #{rejected_array} ========== "
        puts "======= REJECTED ARRAY COUNT #{rejected_array.count} ========== "
        phone_number_arrays
    end

    def self.get_todays_birthdays 
        today = Date.today 
        year,month,day = today.to_s.split("-")
        where('extract(month from birthday) = ? and extract(day from birthday) = ?', month, day)  
    end

    def self.get_up_coming_birthdays 
        today = Date.today 
        year,month,day = today.to_s.split("-")
        where('extract(month from birthday) = ? and extract(day from birthday) > ?', month, day)
    end

    def self.yesterdays_birthdays 
        today = Date.today 
        year,month,day = today.to_s.split("-")
        where('extract(month from birthday) = ? and extract(day from birthday) > ?', month, day)
    end


    def self.this_months_birthdays 
        today = Date.today 
        year,month,day = today.to_s.split("-")
        where('extract(month from birthday) = ?', month)
    end

    def form_birthday_message_today
       first_name = name.split(" ")[0]
       messages = [
              "Hi #{first_name}, this is Bishop Mavis Opoku-Agyemang. I am sending you this message because I heard today is your birthday." +
              "I declare joy abundance into your life in this new chapter. " +
              "May things begin to fall in place for you henceforth in Jesus Name. " +
              "Happy birthday #{first_name}. You are very special. Have a nice day :)",

              "Hey #{first_name}, this is Bishop Mavis Opoku-Agyemang. " + 
              "I am sending you this message because I heard today is your birthday. " +
              "May today mark a new beginning of sweetness in your life. " +
              "May you overcome and have great victory in Jesus Name. " +
              "Happy birthday #{first_name}. You have an amazing personality. Keep it up. Have a nice day :)",

             "Dear #{first_name}, this is Bishop Mavis Opoku-Agyemang. " +
             "I am sending you this message because I heard today is your birthday. " +
             "This is the season you will see peace and experience real joy. " +
             "Your steps will be ordered by God and you will always be a winner in Jesus Name. " + 
             "Happy birthday #{first_name}. Keep being great dear. Have a nice day :)" 
       ].sample 
    end
    
    def first_name
        "#{name.split(" ")[0]}"
    end
    
    
    
end
