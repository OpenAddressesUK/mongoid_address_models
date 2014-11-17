require_relative './tokenable' # Needed because AddressPart gets loaded in first

class AddressPart < Tokenable
  include Mongoid::Geospatial

  field :name, type: String
  field :lat_lng, type: Point
  field :easting_northing, type: Point

  index({ name: 1 })
  index({lat_lng: "2d"})
  index({easting_northing: "2d"}, {min: 0, max: 1300000})
end
