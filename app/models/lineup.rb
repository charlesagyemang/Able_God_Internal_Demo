class Lineup < ApplicationRecord
    belongs_to :service
    has_many :programme

    def type_with_date
        "#{service.service_type}[#{service.date}] - PLU"
    end
end
