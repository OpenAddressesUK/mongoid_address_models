require 'spec_helper'
require_relative '_tokenable_spec'

describe Address do
    it_behaves_like "Tokenable"

    it "creates an address" do
      address = FactoryGirl.create(
                                :address,
                                uprn: "100012345678",
                                sao: "Flat 1",
                                pao: "123",
                                street: FactoryGirl.create(:street, name: "Toy Street"),
                                locality: FactoryGirl.create(:locality, name: "Toytown"),
                                town: FactoryGirl.create(:town, name: "Toyland"),
                                postcode: FactoryGirl.create(:postcode, name: "TOY 123")
                              )

      expect(address.uprn).to eq "100012345678"
      expect(address.sao).to eq "Flat 1"
      expect(address.pao).to eq "123"
      expect(address.street.name).to eq "Toy Street"
      expect(address.locality.name).to eq "Toytown"
      expect(address.town.name).to eq "Toyland"
      expect(address.postcode.name).to eq "TOY 123"
      expect(address.source).to eq("url")
  end

  it "allows source to be set" do
    address = FactoryGirl.create(:address, source: "userInput")

    expect(address.source).to eq("userInput")
  end

  it "generates a full address" do
    address = FactoryGirl.create(
                              :address,
                              uprn: "100012345678",
                              sao: "Flat 1",
                              pao: "123",
                              street: FactoryGirl.create(:street, name: "Toy Street"),
                              locality: FactoryGirl.create(:locality, name: "Toytown"),
                              town: FactoryGirl.create(:town, name: "Toyland"),
                              postcode: FactoryGirl.create(:postcode, name: "TOY 123")
                            )

    expect(address.full_address).to eq("Flat 1, 123 Toy Street, Toytown, Toyland, TOY 123")
  end

  it "generates a full address with strange addressable objects" do
    address = FactoryGirl.create(
                              :address,
                              uprn: "100012345678",
                              sao: "Flat 1",
                              pao: "13 Monster Mansions",
                              street: FactoryGirl.create(:street, name: "Toy Street"),
                              locality: FactoryGirl.create(:locality, name: "Toytown"),
                              town: FactoryGirl.create(:town, name: "Toyland"),
                              postcode: FactoryGirl.create(:postcode, name: "TOY 123")
                            )

    expect(address.full_address).to eq("Flat 1, 13 Monster Mansions, Toy Street, Toytown, Toyland, TOY 123")
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

  it "enforces the presence of a town" do
    address = FactoryGirl.build(:address, town: nil)
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

  it "rebuilds an address from parts" do
    FactoryGirl.create(:address)
    token = Address.first.token
    provenance = Address.first.provenance

    expect(Address.first.postcode.lat_lng.lat).to eq 57.101478
    expect(Postcode.first.token).to eq Address.first.postcode.token

    postcode = Postcode.first
    postcode.lat_lng = [10, 20]
    postcode.save
    Address.first.rebuild_from_parts!
    expect(Address.count).to eq 1
    expect(Address.first.postcode.lat_lng.lat).to eq 20
    expect(Address.first.token).to eq token
    expect(Address.first.provenance).to eq provenance
  end

  it "rebuilds an address from parts with a missing locality" do
    FactoryGirl.create(:address, locality: nil)
    token = Address.first.token
    provenance = Address.first.provenance

    expect(Address.first.postcode.lat_lng.lat).to eq 57.101478
    expect(Postcode.first.token).to eq Address.first.postcode.token

    postcode = Postcode.first
    postcode.lat_lng = [10, 20]
    postcode.save
    Address.first.rebuild_from_parts!
    expect(Address.count).to eq 1
    expect(Address.first.postcode.lat_lng.lat).to eq 20
    expect(Address.first.token).to eq token
    expect(Address.first.provenance).to eq provenance
  end
end
