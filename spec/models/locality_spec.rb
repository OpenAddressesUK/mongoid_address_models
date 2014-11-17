require 'spec_helper'

describe Locality do

  it_behaves_like "Tokenable"

  it "Creates successfully" do
    postcode = FactoryGirl.create(:locality,
          name: "Woughton",
          authority: "E06000042",
          lat_lng: [51.511716, -0.152918],
          easting_northing: [487556, 236786]
        )

    expect(postcode.name).to eq("Woughton")
    expect(postcode.authority).to eq("E06000042")
    expect(postcode.lat_lng.x).to eq(51.511716)
    expect(postcode.lat_lng.y).to eq(-0.152918)
    expect(postcode.easting_northing.x).to eq(487556)
    expect(postcode.easting_northing.y).to eq(236786)
  end

end
