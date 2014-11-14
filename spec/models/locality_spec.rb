require 'spec_helper'

describe Locality do

  it_behaves_like "Tokenable"

  it "Creates successfully" do
    postcode = FactoryGirl.create(:locality,
          name: "Woughton",
          authority: "E06000042",
          location: [51.511716, -0.152918]
        )

    expect(postcode.name).to eq("Woughton")
    expect(postcode.authority).to eq("E06000042")
    expect(postcode.location.x).to eq(51.511716)
    expect(postcode.location.y).to eq(-0.152918)
  end

end
