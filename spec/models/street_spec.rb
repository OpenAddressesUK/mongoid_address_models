require 'spec_helper'

describe Street do

  it_behaves_like "Tokenable"

  it "Default factory has right lat long" do
    street = FactoryGirl.build(:street)
    expect(street.lat_lng.lat).to eq(57.101478)
    expect(street.lat_lng.long).to eq(-2.242835)
  end

  it "Creates successfully" do
    street = FactoryGirl.build(:street,
          name: "ZETLAND TERRACE",
          settlement: "Saltburn-by-the-Sea",
          locality: "Saltburn, Marske and New Marske",
          authority: "Redcar and Cleveland (B)",
          lat_lng: [-0.97886718711, 54.582231587],
          easting_northing: [466096, 521260]
        )

    expect(street.name).to eq("ZETLAND TERRACE")
    expect(street.settlement).to eq("Saltburn-by-the-Sea")
    expect(street.locality).to eq("Saltburn, Marske and New Marske")
    expect(street.authority).to eq("Redcar and Cleveland (B)")
    expect(street.lat_lng.lat).to eq(54.582231587)
    expect(street.lat_lng.long).to eq(-0.97886718711)
    expect(street.easting_northing.x).to eq(466096)
    expect(street.easting_northing.y).to eq(521260)
  end

end
