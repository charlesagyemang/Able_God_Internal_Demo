module LineupsHelper

    def get_time_from_date(time)
        time.to_s.split(" ")[1].split(":")[0..1].join(":")
    end
    
end
