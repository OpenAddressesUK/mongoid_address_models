FactoryGirl.define do

  factory :locality do
    name "Woughton"
    authority "E06000042"
    easting_northing [487556, 236786]
    provenance executed_at: "now", code: "some codez", nested: { this: "works" }
  end

end
