class RaceRef
  include Mongoid::Document
  field :name, as: :n, type: String
  field :date, type: Date

  embedded_in :entrant
  belongs_to :race, foreign_key: "_id"
end
