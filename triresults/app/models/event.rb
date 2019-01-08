class Event
  include Mongoid::Document
  field :order, as: :o, type: Integer
  field :name, as: :n, type: String
  field :distance, as: :d, type: Float
  field :units, as: :u, type: String

  embedded_in :race, touch: true, polymorphic: true
  embeds_one :leg_result
  validates_presence_of :order
  validates_presence_of :name
  
  def meters
    case units
    when "miles" then distance.to_f / 0.000621371
    when "yards" then 0.9144 * distance
    when "kilometers" then 1000 * distance
    when "meters" then distance
    end
  end

  def miles
    case units
    when "meters" then 0.000621371 * distance
    when "yards" then 0.000568182 * distance
    when "kilometers" then 0.621371 * distance
    when "miles" then distance
    end
  end
end
