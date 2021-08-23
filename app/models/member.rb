class Member < ApplicationRecord
    has_many :leaders, dependent: :destroy

    def self.get_all_valid_numbers
        phone_number_arrays = []
        all_members = Member.where.not(phone_number: nil)
        all_members.map  do |member|
            name = member.name.split(" ")[0]
            number = member.phone_number.gsub(" ", "")
            number_starts_with_zero_and_is_ten_digits = number.split("")[0] == "0" && number.length == 10
            phone_number_arrays.push({name: name, number: number}) if number_starts_with_zero_and_is_ten_digits
        end
        phone_number_arrays
    end
    
end
