class Address < Tokenable

  field :pao, type: String
  field :sao, type: String

  embeds_one :street
  embeds_one :locality
  embeds_one :town
  embeds_one :postcode

  def full_address
    address = [
      :sao,
      :pao,
      :street,
      :locality,
      :town,
      :postcode
    ].map { |e| self.send(e).class == String ? self.send(e) : self.send(e).try(:name) }

    address.reject { |e| e.nil? }.join(", ")
  end

end
