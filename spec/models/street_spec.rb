require 'spec_helper'

describe Street do

  it_behaves_like "Tokenable"

  it "Creates successfully" do
    street = FactoryGirl.create(:street,
          name: "ZETLAND TERRACE",
          settlement: "Saltburn-by-the-Sea",
          locality: "Saltburn, Marske and New Marske",
          authority: "Redcar and Cleveland (B)",
          lat_lng: [54.582231587, -0.97886718711],
          easting_northing: [466096, 521260]
        )

    expect(street.name).to eq("ZETLAND TERRACE")
    expect(street.settlement).to eq("Saltburn-by-the-Sea")
    expect(street.locality).to eq("Saltburn, Marske and New Marske")
    expect(street.authority).to eq("Redcar and Cleveland (B)")
    expect(street.lat_lng.x).to eq(54.582231587)
    expect(street.lat_lng.y).to eq(-0.97886718711)
    expect(street.easting_northing.x).to eq(466096)
    expect(street.easting_northing.y).to eq(521260)
  end

  it "Changes shortened prefixes" do
    street = FactoryGirl.create(:street, name: "PIGEON STREET")

    results = Street.where(name: "PIGEON ST.")

    expect(results.count).to eq(1)
    expect(results.first).to eq(street)
  end

  it "works if a prefix doesn't have a full stop" do
    street = FactoryGirl.create(:street, name: "ARCACIA AVENUE")

    results = Street.where(name: "ARCACIA AVE")

    expect(results.count).to eq(1)
    expect(results.first).to eq(street)
  end

  it "ignores things that look like prefixes in the middle of a street" do
    street = FactoryGirl.create(:street, name: "UPPER ST. JOHN STREET")

    results = Street.where(name: "UPPER ST. JOHN STREET")

    expect(results.count).to eq(1)
    expect(results.first).to eq(street)
  end

end
