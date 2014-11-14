require 'spec_helper'

describe Street do

  it_behaves_like "Tokenable"

  it "Creates successfully" do
    street = FactoryGirl.create(:street,
          name: "ZETLAND TERRACE",
          settlement: "Saltburn-by-the-Sea",
          locality: "Saltburn, Marske and New Marske",
          authority: "Redcar and Cleveland (B)",
          location: [54.582231587, -0.97886718711]
        )

    expect(street.name).to eq("ZETLAND TERRACE")
    expect(street.settlement).to eq("Saltburn-by-the-Sea")
    expect(street.locality).to eq("Saltburn, Marske and New Marske")
    expect(street.authority).to eq("Redcar and Cleveland (B)")
    expect(street.location.x).to eq(54.582231587)
    expect(street.location.y).to eq(-0.97886718711)
  end

end
