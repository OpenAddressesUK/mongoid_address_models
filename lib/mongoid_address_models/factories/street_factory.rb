FactoryGirl.define do

  factory :street do
    name "Fake Street"
    provenance executed_at: "now", code: "some codez", nested: { this: "works" }
    lat_lng [-2.242835, 57.101478]
  end

end
