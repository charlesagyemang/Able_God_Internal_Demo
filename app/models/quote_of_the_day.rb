class QuoteOfTheDay < ApplicationRecord

    validates :quote, :date_to_air, presence: true
    validates :date_to_air, uniqueness: true

    def self.today
        self.where("date_to_air = '#{Date.today}'").first
    end
    
end
