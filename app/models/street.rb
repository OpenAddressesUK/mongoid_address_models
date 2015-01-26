class Street

  include AddressPart

  REPLACEMENTS = {
    "(ST|STR)" => "STREET",
    "RD" => "ROAD",
    "WY" => "WAY",
    "(AV|AVE)" => "AVENUE",
    "(DR|DRV)" => "DRIVE",
    "(GR|GRV)" => "GROVE",
    "LN" => "LANE",
    "(GRDNS|GDNS)" => "GARDENS",
    "(PL|PLC)" => "PLACE",
    "(CRES|CRS)" => "CRESCENT",
    "(CL|CLS)" => "CLOSE",
    "(CIRC|CRCS)" => "CIRCUS",
    "MWS" => "MEWS",
    "VL" => "VALE",
    "DN" => "DENE",
    "RS" => "RISE",
    "MD" => "MEAD",
    "(CT|CRT)" => "COURT",
    "(YRD|YD)" => "YARD",
    "(WK|WLK)" => "WALK",
    "PTH" => "PATH",
    "WY" => "WAY"
  }

  field :settlement, type: String
  field :locality, type: String
  field :authority, type: String

  def self.where(expression)
    if expression.is_a?(::Hash)
      expression.symbolize_keys!
      if expression.has_key?(:name)
        REPLACEMENTS.each do |f,r|
          expression[:name] = expression[:name].gsub(/ (#{f}\.?)$/i, " #{r}")
        end
      end
    end
    super
  end

end
