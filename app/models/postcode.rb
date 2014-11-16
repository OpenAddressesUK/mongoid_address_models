class Postcode < Tokenable
  include Mongoid::Geospatial

  field :name, type: String
  field :area, type: String
  field :outcode, type: String
  field :incode, type: String
  field :easting, type: Integer
  field :northing, type: Integer
  field :introduced, type: Date
  field :terminated, type: Date
  field :authority, type: String

  geo_field :location

  index({ name: 1 })
end
