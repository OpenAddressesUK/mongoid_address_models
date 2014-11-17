require_relative './tokenable' # Needed because AddressPart gets loaded in first

class AddressPart < Tokenable
  include Mongoid::Geospatial

  field :name, type: String

  geo_field :location

  index({ name: 1 })
end
