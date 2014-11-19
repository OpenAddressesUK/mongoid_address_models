class Address < Tokenable

  before_validation :generate_full_address
  validates_uniqueness_of :full_address

  validates_presence_of :street
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
        unless e == :pao && val =~ /\d/
          if e == :street && self.pao =~ /\d/ && !val.nil?
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

end
