class Point
	attr_accessor :longitude, :latitude

	def initialize longitude, latitude
		@longitude = longitude
		@latitude = latitude
	end

	def mongoize
		{:type=>'Point', :coordinates=>[@longitude, @latitude]}
	end

	def self.demongoize object
		case object
		when nil then object
		when Hash then Point.new(object[:coordinates][0], object[:coordinates][1])
		when Point then object
		end
		
	end

	def self.mongoize object
		case object
		when Point then object.mongoize
		when Hash then
			if object[:type]
				Point.new(object[:coordinates][0], object[:coordinates][1]).mongoize
			else
				Point.new(object[:longitude], object[:latitude]).mongoize
			end
		else object
		end
	end

	def self.evolve object
		case object
		when Point then object.mongoize
		else object
		end
	end
end
