require 'spec_helper'

describe Address do
    it_behaves_like "Tokenable"

    it "creates an address" do
      address = FactoryGirl.create(
                                :address,
                                sao: "Flat 1",
                                pao: "123",
                                street: FactoryGirl.create(:street, name: "Toy Street"),
                                locality: FactoryGirl.create(:locality, name: "Toytown"),
                                town: FactoryGirl.create(:town, name: "Toyland"),
                                postcode: FactoryGirl.create(:postcode, name: "TOY 123")
                              )

      expect(address.sao).to eq "Flat 1"
      expect(address.pao).to eq "123"
      expect(address.street.name).to eq "Toy Street"
      expect(address.locality.name).to eq "Toytown"
      expect(address.town.name).to eq "Toyland"
      expect(address.postcode.name).to eq "TOY 123"
  end

  it "generates a full address" do
    address = FactoryGirl.create(
                              :address,
                              sao: "Flat 1",
                              pao: "123",
                              street: FactoryGirl.create(:street, name: "Toy Street"),
                              locality: FactoryGirl.create(:locality, name: "Toytown"),
                              town: FactoryGirl.create(:town, name: "Toyland"),
                              postcode: FactoryGirl.create(:postcode, name: "TOY 123")
                            )

    expect(address.full_address).to eq("Flat 1, 123 Toy Street, Toytown, Toyland, TOY 123")
  end

  it "changes full address on subsequent save" do
    address = FactoryGirl.create(:address)

    expect(address.full_address).to eq("The Batcave, Stately Wayne Manor, Bat Street, Arkham, Gotham City, W12 8QT")

    address.town = FactoryGirl.create(:town, name: "Gotham")
    address.save

    expect(address.full_address).to eq("The Batcave, Stately Wayne Manor, Bat Street, Arkham, Gotham, W12 8QT")
  end

  it "enforces the uniqueness of a full address" do
    FactoryGirl.create(:address)
    address = FactoryGirl.build(:address)
    address.save

    expect(address.valid?).to eq(false)
  end

  it "enforces the presence of a street" do
    address = FactoryGirl.build(:address, street: nil)
    address.save

    expect(address.valid?).to eq(false)
  end

  it "enforces the presence of either a pao or sao" do
    address1 = FactoryGirl.build(:address, pao: nil, sao: nil)
    address2 = FactoryGirl.build(:address, sao: nil)
    address3 = FactoryGirl.build(:address, pao: nil)

    address1.save
    address2.save
    address3.save

    expect(address1.valid?).to eq(false)
    expect(address2.valid?).to eq(true)
    expect(address3.valid?).to eq(true)
  end

end
