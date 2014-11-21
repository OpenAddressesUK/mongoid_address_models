FactoryGirl.define do

  factory :town do
    name "Birmingham"
    area "B"
    provenance executed_at: "now", code: "some codez", nested: { this: "works" }
  end

end
