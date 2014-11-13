class Address < Tokenable

  field :pao, type: String
  field :sao, type: String
  field :street, type: String

  embeds_one :locality
  embeds_one :town
  embeds_one :postcode

end
