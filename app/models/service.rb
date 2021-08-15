class Service < ApplicationRecord

    has_one :lineup, dependent: :destroy


    default_scope { order(updated_at: :desc) }

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
