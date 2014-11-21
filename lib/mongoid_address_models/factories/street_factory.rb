FactoryGirl.define do

  factory :street do
    name "Fake Street"
    provenance executed_at: "now", code: "some codez", nested: { this: "works" }
  end

end
