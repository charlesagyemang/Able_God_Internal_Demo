class Member < ApplicationRecord
    has_many :leaders, dependent: :destroy

    def self.get_all_valid_numbers
        phone_number_arrays = []
        all_members = Member.where.not(phone_number: nil)
        all_members.map {|member| phone_number_arrays.push(member.phone_number.gsub(" ", "")) if member.phone_number.gsub(" ", "").length == 10 }
        phone_number_arrays
    end
    
end
