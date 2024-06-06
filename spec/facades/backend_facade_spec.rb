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
    expect(result.id).to eq("100")
    expect(result.uid).to eq("1234567890")
    expect(result.username).to eq("testuser123")
  end

  describe '#get_campaign' do
    it 'returns a campaign object', :vcr do
      campaign = BackendFacade.get_campaign(1)

      expect(campaign).to be_a Campaign
    end
  end

  describe '#create_character', :vcr do
    it 'creates a character with the passed in argument info and returns Character', :vcr do
      character_info = {data: {name: 'Character Name', dnd_race: 'Human', dnd_class: 'Bard', user_id: 1}, character_image: {}}
      character = BackendFacade.create_character(character_info)

      expect(character).to be_a Character
    end
  end
  # User Campaign

  describe '#create_campaign', :vcr do
    it 'creates a new campaign with the argument campaign name and returns a Campaign' do
      campaign = BackendFacade.create_campaign('Random Name')

      expect(campaign).to be_a Campaign
    end
  end

  describe '#get_campaign_items' do
    it 'returns an array of item objects', :vcr do
      items = BackendFacade.get_campaign_items(1)

      expect(items).to be_a Array
      items.each do |item|
        expect(item).to be_a Item
      end
    end
  end

  describe '#get_campaign_characters', :vcr do
    it 'returns an array of character objects', :vcr do
      characters = BackendFacade.get_campaign_characters(1)

      expect(characters).to be_an Array
      characters.each do |character|
        expect(character).to be_a Character
      end
    end
  end

  describe '#item' do
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
  end

  describe '#get_user_campaigns' do
    it 'returns an array of all UserCampaign objects that a user has', :vcr do
      user_campaigns = BackendFacade.get_user_campaigns(1)

      user_campaigns.each do |campaign|
        expect(campaign).to be_a UserCampaign
      end
    end
  end

  # ManagementForm
end
