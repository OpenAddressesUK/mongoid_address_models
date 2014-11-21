module AddressPart
  
  extend ActiveSupport::Concern
  
  included do
  
    include Tokenable
    include Mongoid::Geospatial

    validates_presence_of :name

    field :name, type: String
    field :lat_lng, type: Point
    field :easting_northing, type: Point

    index({ name: 1 })
    index({lat_lng: "2d"})
    index({easting_northing: "2d"}, {min: 0, max: 1300000})
  end
end
