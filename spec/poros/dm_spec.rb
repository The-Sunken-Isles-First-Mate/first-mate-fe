require 'rails_helper'

RSpec.describe Dm do
  it 'exists and has attributes' do
    dm = Dm.new({
      id: "12345",
      campaign_id: "1"
    })

    expect(dm).to be_a(Dm)
    expect(dm.id).to eq("12345")
    expect(dm.campaign_id).to eq("1") 
  end
end