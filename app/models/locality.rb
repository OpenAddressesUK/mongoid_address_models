class Locality

  include AddressPart
  include Mongoid::Elasticsearch

  field :authority, type: String

  elasticsearch!
end
