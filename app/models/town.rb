class Town

  include AddressPart
  include Mongoid::Elasticsearch

  field :area, type: String

  elasticsearch!
end
