FactoryGirl.define do

  factory :address do
    postcode { FactoryGirl.create(:postcode, postcode: "W12 8QT") }
    town { FactoryGirl.create(:town, name: "Gotham City") }
    locality { FactoryGirl.create(:locality, name: "Arkham") }
    street "123 Bat Street"
    pao "Stately Wayne Manor"
    sao "The Batcave"
  end

end
