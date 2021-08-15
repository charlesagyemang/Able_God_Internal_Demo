class Lineup < ApplicationRecord
    belongs_to :service
    has_many :programme

    def type_with_date
        leader = Leader.includes(:member).find(service.leader_id)
        "#{service.service_type}[#{service.date}]#{leader.member.name} - PLU"
    end
end
