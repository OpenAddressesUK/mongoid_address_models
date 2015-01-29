class Street

  include AddressPart
  include Searchable
  
  field :settlement, type: String
  field :locality, type: String
  field :authority, type: String

end
