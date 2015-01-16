class Street

  include AddressPart
  include Mongoid::Elasticsearch

  field :settlement, type: String
  field :locality, type: String
  field :authority, type: String

  elasticsearch!
end
