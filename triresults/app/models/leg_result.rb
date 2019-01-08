class LegResult
  include Mongoid::Document
  field :secs, type: Float
  embedded_in :entrant
  embeds_one :event
  validates_presence_of :event, order: [:"event.o".asc]
  def calc_ave
  end

  after_initialize do |doc|
    calc_ave
  end

  def secs= value
    self[:secs]=value
    calc_ave
  end
end

class SwimResult < LegResult
  
  field :pace_100, type: Float
  def calc_ave
    if event && secs
      meters = event.meters
      self.pace_100=secs/(meters/100)
      end
  end
end




