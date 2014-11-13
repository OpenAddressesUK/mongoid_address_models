require 'spec_helper'

describe Address do
  it_behaves_like "Tokenable"

    it "creates an address" do
      address = FactoryGirl.create(
                                :address,
                                pao: "Flat 1",
                                sao: "123",
                                street: "Toy Street",
                                locality: "Toytown",
                                town: "Toyland",
                                postcode: "TOY 123"
                              )


      expect(address.pao).to eq "Flat 1"
      expect(address.sao).to eq "123"
      expect(address.street).to eq "Toy Street"
      expect(address.locality).to eq "Toytown"
      expect(address.town).to eq "Toyland"
      expect(address.postcode).to eq "TOY 123"
  end

  end

end
