class Service < ApplicationRecord

    default_scope -> { order(updated_at: :desc) }

    has_one :lineup, dependent: :destroy
    has_one :department

    def type_with_date
        "#{service_type}[#{date}]"
    end

    def line_up_count
        activities = Programme.where(:lineup_id => lineup.id)
        {
            mc: "#{lineup.mc}",
            size: activities.length
        }
    end
    
end
