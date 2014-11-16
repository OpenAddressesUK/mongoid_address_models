class Street < Tokenable
  include Mongoid::Geospatial

  field :name, type: String
  field :settlement, type: String
  field :locality, type: String
  field :authority, type: String

  geo_field :location

  index({ name: 1 })
end
