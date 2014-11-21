require 'date'

FactoryGirl.define do

  factory :postcode do
    name "AB1 0AA"
    area "AB"
    outcode "AB1"
    incode "0AA"
    introduced Date.parse("1980-01-01")
    terminated Date.parse("1996-06-01")
    authority "S12000033"
    lat_lng [57.101478, -2.242835]
    easting_northing [801193, 385386]
    provenance executed_at: "now", code: "some codez", nested: { this: "works" }
  end

end
