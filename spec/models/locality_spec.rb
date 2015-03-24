require 'spec_helper'

describe Locality do

  it_behaves_like "Tokenable"

  it "Default factory has right lat long" do
    locality = FactoryGirl.build(:locality)
    expect(locality.lat_lng.lat).to eq(57.101478)
    expect(locality.lat_lng.long).to eq(-2.242835)
  end

  it "Creates successfully" do
    postcode = FactoryGirl.build(:locality,
          name: "Woughton",
          authority: "E06000042",
          lat_lng: [-0.152918, 51.511716],
          easting_northing: [487556, 236786]
        )

    expect(postcode.name).to eq("Woughton")
    expect(postcode.authority).to eq("E06000042")
    expect(postcode.lat_lng.lat).to eq(51.511716)
    expect(postcode.lat_lng.long).to eq(-0.152918)
    expect(postcode.easting_northing.x).to eq(487556)
    expect(postcode.easting_northing.y).to eq(236786)
  end

end
