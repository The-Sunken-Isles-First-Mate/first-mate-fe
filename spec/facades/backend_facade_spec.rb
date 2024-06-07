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
    expect(result.id).to eq("5")
    expect(result.uid).to eq("1234567890")
    expect(result.username).to eq("testuser123")
  end

  describe '#get_campaign' do
    it 'returns a campaign object', :vcr do
      result = BackendFacade.get_campaign(1)

      expect(result).to be_a Campaign
      expect(result.id).to be_an(String)
      expect(result.name).to be_an(String)
      expect(result.food).to be_an(Integer)
      expect(result.week).to be_an(Integer)
      expect(result.wood).to be_an(Integer)
      expect(result.metal).to be_an(Integer)
      expect(result.stone).to be_an(Integer)
      expect(result.cloth).to be_an(Integer)
      expect(result.villagers).to be_an(Integer)
      expect(result.farmed_goods).to be_an(Integer)
      expect(result.foraged_goods).to be_an(Integer)
      expect(result.monster_parts).to be_an(Integer)
      expect(result.animal_products).to be_an(Integer)
    end
  end

  describe '#get_campaign_items' do
    it 'returns an array of item objects', :vcr do
      result = BackendFacade.get_campaign_items(1)
      r      = result.first

      expect(result).to be_a Array
      expect(r).to be_a Item

      expect(r.name).to be_a(String)
      expect(r.quantity).to be_a(Integer)
    end
  end

  describe '#get_campaign_characters', :vcr do
    it 'returns an array of character objects', :vcr do
      result = BackendFacade.get_campaign_characters(1)
      r      = result.first

      expect(result).to be_an Array
      expect(r).to be_a Character
      
      expect(r.id).to be_a(String)
      expect(r.name).to be_a(String)
      expect(r.dnd_race).to be_a(String)
      expect(r.dnd_class).to be_a(String)
    end
  end

  describe '#create_campaign', :vcr do
    it 'creates a new campaign with the argument campaign name and returns a Campaign' do
      result = BackendFacade.create_campaign('Random Name')

      expect(result).to be_a Campaign
      expect(result.id).to be_an(String)
      expect(result.name).to be_an(String)
      expect(result.food).to be_an(Integer)
      expect(result.week).to be_an(Integer)
      expect(result.wood).to be_an(Integer)
      expect(result.metal).to be_an(Integer)
      expect(result.stone).to be_an(Integer)
      expect(result.cloth).to be_an(Integer)
      expect(result.villagers).to be_an(Integer)
      expect(result.farmed_goods).to be_an(Integer)
      expect(result.foraged_goods).to be_an(Integer)
      expect(result.monster_parts).to be_an(Integer)
      expect(result.animal_products).to be_an(Integer)
    end
  end

  xit "can create a user campaign", :vcr do 
    result = BackendFacade.create_user_campaign_dm(1, 1)
    require 'pry'; binding.pry
  end

  xit "can create a user campaign pl?", :vcr do 

  end

  describe '#create_character', :vcr do
    it 'creates a character with the passed in argument info and returns Character', :vcr do
      character_info = {data: {name: 'Character Name', dnd_race: 'Human', dnd_class: 'Bard', user_id: 1}, character_image: {}}
      result         = BackendFacade.create_character(character_info)

      expect(result).to be_a Character
      
      expect(result.user_id).to be_a(Integer)
      expect(result.id).to be_a(String)
      expect(result.name).to be_a(String)
      expect(result.dnd_race).to (be_a(String).or be_nil)
      expect(result.dnd_class).to (be_a(String).or be_nil)
      expect(result.image_url).to (be_a(String).or be_nil)
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
