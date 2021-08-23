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
    
end
