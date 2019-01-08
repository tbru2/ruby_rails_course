class RunResult < LegResult
    field :minute_mile, as: :mmile, type: Float
    def calc_ave
      if event && secs
        miles = event.miles
        self.minute_mile=(secs/60)/miles
        end
    end
  end