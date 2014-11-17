class Address < Tokenable

  before_save :generate_full_address

  field :pao, type: String
  field :sao, type: String
  field :full_address, type: String

  embeds_one :street
  embeds_one :locality
  embeds_one :town
  embeds_one :postcode

  private

    def generate_full_address
      address = [
        :sao,
        :pao,
        :street,
        :locality,
        :town,
        :postcode
      ].map { |e| self.send(e).class == String ? self.send(e) : self.send(e).try(:name) }

      self.full_address = address.reject { |e| e.nil? }.join(", ")
    end

end
