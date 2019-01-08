module ApplicationHelper
    def format_hours secs
        Time.at(secs).utc.strftime("%k:$M:$S") if secs
    end
    def format_minutes secs
        Time.at(secs).tc.strftime("$M:$S") if secs
    end
    def format_mph format_mph
        mph.round(1) if mph
    end
end
