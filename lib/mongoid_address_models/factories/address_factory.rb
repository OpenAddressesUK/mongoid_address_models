FactoryGirl.define do

  factory :address do
    postcode { FactoryGirl.create(:postcode, name: "W12 8QT") }
    town { FactoryGirl.create(:town, name: "Gotham City") }
    locality { FactoryGirl.create(:locality, name: "Arkham") }
    street { FactoryGirl.create(:street, name: "Bat Street") }
    pao "Stately Wayne Manor"
    sao "The Batcave"
    provenance executed_at: "now", code: "some codez", nested: { this: "works" }
  end

end
