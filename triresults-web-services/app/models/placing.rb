class Placing
    attr_accessor :name, :place

    def initialize name, place
        @name = name
        @place = place
    end

    def mongoize
        {:name => @name,:place => @place}
    end

    def self.demongoize object
        case object
        when nil then object
        when Hash then Placing.new(object[:name], object[:place])
        when Placing then object
        end
    end
end