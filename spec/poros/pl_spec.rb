require 'rails_helper'

RSpec.describe Pl do
  it 'exists and has attributes' do
    pl = Pl.new({
      id: "12345",
      campaign_id: "1"
    })

    expect(pl).to be_a(Pl)
    expect(pl.id).to eq("12345")
    expect(pl.campaign_id).to eq("1") 
  end
end