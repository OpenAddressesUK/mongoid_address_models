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
      :pao
    ].map { |e| self.send(e) }

    address << [
      :street,
      :locality,
      :town,
      :postcode
    ].map { |e| self.send(e).name }

    address.reject { |e| e.nil? }.join(", ")
  end

end
