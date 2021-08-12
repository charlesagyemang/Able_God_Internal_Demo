class Service < ApplicationRecord

    def type_with_date
        "#{service_type}[#{date}]"
    end
    
end
