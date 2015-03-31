require 'spec_helper'

shared_examples_for "Tokenable" do

  it "generates a token" do
    object = FactoryGirl.create(described_class)

    expect(object.token.length).to eq(6)
  end

  it "can have a provenance record" do
    object = FactoryGirl.create(described_class)
    
    expect(object.provenance).to eq(
      { executed_at: "now", code: "some codez", nested: { this: "works" } }
    )
  end
  
end
