class Address < Tokenable

  before_validation :generate_full_address
  validates_uniqueness_of :full_address

  validates_presence_of :street
  validates_presence_of :pao, if: :sao_blank?
  validates_presence_of :sao, if: :pao_blank?

  field :pao, type: String
  field :sao, type: String
  field :full_address, type: String

  embeds_one :street
  embeds_one :locality
  embeds_one :town
  embeds_one :postcode

  index({ full_address: 1 })

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

    def sao_blank?
      sao.blank?
    end

    def pao_blank?
      pao.blank?
    end

end
