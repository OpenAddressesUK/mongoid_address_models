class Address

  include Tokenable

  before_validation :generate_full_address
  validates_uniqueness_of :full_address

  validates_presence_of :street
  validates_presence_of :town
  validates_presence_of :pao, if: :sao_blank?
  validates_presence_of :sao, if: :pao_blank?

  field :pao, type: String
  field :sao, type: String
  field :full_address, type: String
  field :full_address_lines, type: Array

  embeds_one :street
  embeds_one :locality
  embeds_one :town
  embeds_one :postcode

  index({ full_address: 1 })
  index({ updated_at: 1 }, {background: true})
  index({ "street.name" => 1 })
  index({ "postcode.name" => 1 })
  index({ "town.name" => 1 })
  index({ "locality.name" => 1 })
  index({ "street.token" => 1 }, {background: true})
  index({ "postcode.token" => 1 }, {background: true})
  index({ "town.token" => 1 }, {background: true})
  index({ "locality.token" => 1 }, {background: true})


  def rebuild_from_parts!
    delete

    new_street = Street.find_by_token street.token
    new_locality = Locality.find_by_token locality.token
    new_town = Town.find_by_token town.token
    new_postcode = Postcode.find_by_token postcode.token

    Address.create! pao: pao,
                    sao: sao,
                    street: new_street,
                    locality: new_locality,
                    town: new_town,
                    postcode: new_postcode,
                    token: token,
                    provenance: provenance
  end

  private

    def generate_lines
      address =  [
                  :sao,
                  :pao,
                  :street,
                  :locality,
                  :town,
                  :postcode
      ].map do |e|
        val = self.send(e).class == String ? self.send(e) : self.send(e).try(:name)
        unless e == :pao && val =~ num_regex
          if e == :street && self.pao =~ num_regex && !val.nil?
            self.pao + ' ' + val
          else
            val
          end
        end
      end

      address.reject { |e| e.nil? }
    end

    def generate_full_address
      self.full_address_lines = generate_lines
      self.full_address = generate_lines.join(", ")
    end

    def sao_blank?
      sao.blank?
    end

    def pao_blank?
      pao.blank?
    end

    def num_regex
      /^( ?\d+ ?[a-z]?( -)?){1,2}$/
    end
end
