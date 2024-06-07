require 'rails_helper'

RSpec.describe BackendFacade do
  describe '#get_user' do
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

  # describe 'get_management_form' do
  #   it 'returns something', :vcr do
  #   end
  # end

  describe 'get_all_items' do
    it "can hit back end endpoint - items", :vcr do
      query  = BackendService.call_db('items/1')
      result = query[:data]

      expect(query).to be_an Hash
      expect(result).to be_a Hash
      check_hash_structure(result[:attributes], :name, String)
      check_hash_structure(result[:attributes], :animal_products_cost, Integer)
      check_hash_structure(result[:attributes], :cloth_cost, Integer)
      check_hash_structure(result[:attributes], :farmed_goods_cost, Integer)
      check_hash_structure(result[:attributes], :food_cost, Integer)
      check_hash_structure(result[:attributes], :foraged_goods_cost, Integer)
      check_hash_structure(result[:attributes], :metal_cost, Integer)
      check_hash_structure(result[:attributes], :stone_cost, Integer)
      check_hash_structure(result[:attributes], :wood_cost, Integer)
      check_hash_structure(result[:attributes], :monster_parts_cost, Integer)
    end
  end

  describe '#get_campaign_characters' do
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

  describe '#create_campaign' do
    it 'creates a new campaign with the argument campaign name and returns a Campaign', :vcr do
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

  xit "can create a user campaign" do
    result = BackendFacade.create_user_campaign_dm(1, 1)
    require 'pry'; binding.pry
  end

  xit "can create a user campaign pl?", :vcr do

  end

  describe '#create_character' do
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

  describe '#create_campaign'do
    it 'creates a new campaign with the argument campaign name and returns a Campaign', :vcr do
      campaign = BackendFacade.create_campaign('Random Name')

      expect(campaign).to be_a Campaign
      expect(campaign.id).to eq(campaign.id)
      expect(campaign.name).to eq('Random Name')
      expect(campaign.week).to eq(0)
      expect(campaign.villagers).to eq(120)
      expect(campaign.animal_products).to eq(0)
      expect(campaign.cloth).to eq(0)
      expect(campaign.farmed_goods).to eq(0)
      expect(campaign.food).to eq(0)
      expect(campaign.foraged_goods).to eq(0)
      expect(campaign.metal).to eq(0)
      expect(campaign.monster_parts).to eq(0)
      expect(campaign.stone).to eq(0)
      expect(campaign.wood).to eq(0)
    end
  end

  # describe '#create_user_campaign_dm' do
  # end

  # describe '#create_user_campaign_pl' do
  # end

  describe '#create_character' do
    it 'creates a character with the passed in argument info and returns Character', :vcr do
      character_info = {data: {name: 'Character Name', dnd_race: 'Human', dnd_class: 'Bard', user_id: 1}, character_image: {}}
      character = BackendFacade.create_character(character_info)

      expect(character).to be_a Character
    end
  end

  # describe '#patch_management_form' do
  # end

  # describe '#post_advance_week' do
  # end

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
end
