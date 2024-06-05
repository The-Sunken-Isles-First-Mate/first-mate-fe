require 'rails_helper'

RSpec.describe BackendFacade do
  # User
  it "can get user info", :vcr do
    result = BackendFacade.get_user({
      uid: "1234567890",
      username: "testuser123",
      token: "1234asdf"
    })

    expect(result).to be_a User
    expect(result.id).to eq("1")
    expect(result.uid).to eq("1234567890")
    expect(result.username).to eq("testuser123")
  end

  # Character

  # User Campaign

  # Campaign

  # CampaignItem

  # Go back and turn into a poro
  it "can get item info", :vcr do
    result = BackendFacade.item(1)

    expect(result).to be_a Hash
    expect(result[:data]).to be_a Hash
    expect(result[:data][:attributes][:name]).to eq("Light armor")
    expect(result[:data][:attributes][:animal_products_cost]).to eq(1)
    expect(result[:data][:attributes][:cloth_cost]).to eq(0)
    expect(result[:data][:attributes][:farmed_goods_cost]).to eq(0)
    expect(result[:data][:attributes][:food_cost]).to eq(0)
    expect(result[:data][:attributes][:foraged_goods_cost]).to eq(0)
    expect(result[:data][:attributes][:metal_cost]).to eq(1)
    expect(result[:data][:attributes][:stone_cost]).to eq(0)
    expect(result[:data][:attributes][:wood_cost]).to eq(0)
    expect(result[:data][:attributes][:monster_parts_cost]).to eq(0)
  end

  # ManagementForm
end