require 'spec_helper'

describe Address do
    it_behaves_like "Tokenable"

    it "creates an address" do
      address = FactoryGirl.create(
                                :address,
                                pao: "Flat 1",
                                sao: "123",
                                street: FactoryGirl.create(:street, name: "Toy Street"),
                                locality: FactoryGirl.create(:locality, name: "Toytown"),
                                town: FactoryGirl.create(:town, name: "Toyland"),
                                postcode: FactoryGirl.create(:postcode, name: "TOY 123")
                              )


      expect(address.pao).to eq "Flat 1"
      expect(address.sao).to eq "123"
      expect(address.street.name).to eq "Toy Street"
      expect(address.locality.name).to eq "Toytown"
      expect(address.town.name).to eq "Toyland"
      expect(address.postcode.name).to eq "TOY 123"
  end

  it "generates a full address" do
    address = FactoryGirl.create(:address)

    expect(address.full_address).to eq("The Batcave, Stately Wayne Manor, Bat Street, Arkham, Gotham City, W12 8QT")
  end

  it "changes full address on subsequent save" do
    address = FactoryGirl.create(:address)

    expect(address.full_address).to eq("The Batcave, Stately Wayne Manor, Bat Street, Arkham, Gotham City, W12 8QT")

    address.town = FactoryGirl.create(:town, name: "Gotham")
    address.save

    expect(address.full_address).to eq("The Batcave, Stately Wayne Manor, Bat Street, Arkham, Gotham, W12 8QT")
  end

  it "enforces the uniqueness of a full address" do
    2.times do
      FactoryGirl.create(:address)
    end

    expect(Address.count).to eq(1)
  end

end
