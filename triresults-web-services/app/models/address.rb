class Address
  #include Mongoid::Document
  attr_accessor :city, :state, :location
  
  def initialize(city=nil, state=nil, loc=nil)
    @city = city
    @state= state
    @location = loc
  end

  def mongoize
    {:city=>@city, :state=>@state, :loc=>@location}
  end

  def self.demongoize object
    case object
    when nil then object
    when Hash then Address.new(object[:city], object[:state], object[:loc])
    when Address then object
    end
  end
  
  def self.mongoize object
    case object
    when nil then object
    when Hash then Address.new(object[:city], object[:state], object[:loc]).mongoize
    when Address then object.mongoize
    end
  end
end
