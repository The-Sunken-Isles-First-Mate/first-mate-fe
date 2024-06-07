require 'rails_helper'

RSpec.describe Campaign do
  it 'exists and has attributes' do
    campaign = Campaign.new({
      id: "12345",
      name: "Cool Campaign",
      week: 0, 
      animal_products: 0,
      cloth: 0,
      farmed_goods: 0,
      food: 0,
      foraged_goods: 0,
      metal: 0,
      monster_parts: 0,
      stone: 0,
      wood: 0,
      villagers: 120
    })

    expect(campaign).to be_a(Campaign)
    expect(campaign.id).to eq("12345")
    expect(campaign.name).to eq("Cool Campaign") 
    expect(campaign.week).to eq(0)
    expect(campaign.animal_products).to eq(0)
    expect(campaign.cloth).to eq(0)
    expect(campaign.farmed_goods).to eq(0)
    expect(campaign.food).to eq(0)
    expect(campaign.foraged_goods).to eq(0)
    expect(campaign.metal).to eq(0)
    expect(campaign.monster_parts).to eq(0)
    expect(campaign.stone).to eq(0)
    expect(campaign.wood).to eq(0)
    expect(campaign.villagers).to eq(120)
  end
end