FactoryGirl.define do

  factory :address do
    postcode { FactoryGirl.build(:postcode, name: "W12 8QT") }
    town { FactoryGirl.build(:town, name: "Gotham City") }
    locality { FactoryGirl.build(:locality, name: "Arkham") }
    street { FactoryGirl.build(:street, name: "Bat Street") }
    pao "Stately Wayne Manor"
    sao "The Batcave"
    provenance executed_at: "now", code: "some codez", nested: { this: "works" }
  end

end
