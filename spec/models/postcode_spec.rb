require 'spec_helper'

describe Postcode do

  it_behaves_like "Tokenable"

  it "Creates successfully" do
    postcode = FactoryGirl.create(:postcode,
          name: "SW1A 1AA",
          area: "SW1",
          outcode: "SW1A",
          incode: "1AA",
          introduced: Date.parse("1980-01-01"),
          terminated: nil,
          authority: "E09000033",
          lat_lng: [51.511716, -0.152918],
          easting_northing: [179645, 529090]
        )

    expect(postcode.name).to eq("SW1A 1AA")
    expect(postcode.area).to eq("SW1")
    expect(postcode.outcode).to eq("SW1A")
    expect(postcode.incode).to eq("1AA")
    expect(postcode.introduced).to eq(Date.parse("1980-01-01"))
    expect(postcode.terminated).to eq(nil)
    expect(postcode.authority).to eq("E09000033")
    expect(postcode.lat_lng.x).to eq(51.511716)
    expect(postcode.lat_lng.y).to eq(-0.152918)
    expect(postcode.easting_northing.x).to eq(179645)
    expect(postcode.easting_northing.y).to eq(529090)
  end

end
