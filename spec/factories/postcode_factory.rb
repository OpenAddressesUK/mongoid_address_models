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
    location [57.101478, -2.242835]
  end

end
