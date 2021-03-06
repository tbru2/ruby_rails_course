class RacerInfo
  include Mongoid::Document
  field :fn, as: :first_name, type: String
  field :ln, as: :last_name, type: String
  field :g, as: :gender, type: String
  field :yr, as: :birth_year, type: Integer
  field :res, as: :residence, type: Address
  field :_id, as: :racer_id
  field :_id, default:->{ racer_id }

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates :gender, acceptance: { accept: ['M', 'F'] }
  validates :birth_year, numericality: { less_than: Time.new.year+1, message: "must be in the past"}
  embedded_in :racer, polymorphic: true

  ["city", "state"].each do |action|
    define_method("#{action}") do
      self.residence ? self.residence.send("#{action}") : nil
    end
    define_method("#{action}=") do |name|
      object=self.residence ||= Address.new
      object.send("#{action}=", name)
      self.residence=object
    end
  end
end
