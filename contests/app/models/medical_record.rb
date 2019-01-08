class MedicalRecord
  include Mongoid::Document
  field :conditions, type: Array
  belongs_to :racer, validate: true
end
