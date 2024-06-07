require 'rails_helper'

RSpec.describe BackendService do
  it 'can make a call for users', :vcr do
    params = {
      uid: '1',
      username: "bob",
      token: "example"
    }

    query  = BackendService.call_db_for_user(params)
    result = query[:data][:attributes]

    expect(query).to be_an Hash
    expect(result).to be_a Hash
    check_hash_structure(result, :uid, String)
    check_hash_structure(result, :username, String)
    check_hash_structure(result, :token, String)
  end

  it "can return a campaign and its attributes", :vcr do
    query = BackendService.call_db_for_campaign("campaigns/1")
  # it 'can call the db for a user', :vcr do
  end

  it 'can call the db for a campaign', :vcr do
    query = BackendService.call_db_for_campaign(1) #("/api/v1/campaigns/1")
    result = query[:data]

    expect(query).to be_a Hash
    expect(result).to be_a Hash

    expect(result).to have_key(:id)
    expect(result[:id]).to be_a String

    expect(result).to have_key(:type)
    expect(result[:type]).to eq('campaign')

    expect(result).to have_key(:attributes)
    expect(result[:attributes]).to be_a Hash

    expect(result).to have_key(:relationships)
    expect(result[:relationships]).to be_a Hash

    expect(result[:relationships]).to have_key(:user_campaigns)
    expect(result[:relationships][:user_campaigns]).to be_a Hash

    expect(result[:relationships]).to have_key(:users)
    expect(result[:relationships][:users]).to be_a Hash

    expect(result[:relationships]).to have_key(:characters)
    expect(result[:relationships][:characters]).to be_a Hash

    expect(result[:relationships]).to have_key(:campaign_items)
    expect(result[:relationships][:campaign_items]).to be_a Hash

    expect(result[:relationships]).to have_key(:items)
    expect(result[:relationships][:items]).to be_a Hash
  end

  it "can hit back end endpoint - items", :vcr do
    query  = BackendService.call_db('/api/v1/items/1')

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

  it "can return all characters from a campaign and their attributes", :vcr do
    query  = BackendService.call_db_for_campaign_characters("/api/v1/campaigns/1/characters")
  # it 'can call the db for all campaign items', :vcr do
  end

  # it 'can call the db for a management_form', :vcr do
  # end

  it 'can call the db for items', :vcr do
    query = BackendService.call_db('items/1')
    result = query[:data]

    expect(query).to be_an Hash
    expect(result).to be_a Hash
    check_hash_structure(result[:attributes], :name, String)
  end

  it 'can call the db for campaign characters', :vcr do
    query = BackendService.call_db_for_campaign_characters(1)

    result = query[:data]

    result.each do |character|
      expect(character[:id]).to be_a String
      expect(character[:type]).to eq "character"
      expect(character[:attributes][:name]).to be_a String
      expect(character[:attributes][:user_id]).to be_an Integer
      expect(character[:attributes][:dnd_race]).to be_a String
      expect(character[:attributes][:dnd_class]).to be_a String
      expect(character[:attributes]).to have_key(:image_url)
    end
  end

  xit "can call the campaign", :vcr do
    body  =  {
                name: "example"
              }
    query = BackendService.post_db_campaign(body)

  end

  it "can hit user campaigns", :vcr do
    query  = BackendService.post_db_user_campaign_pl(1, 1)
    result = query[:data]

    expect(query).to be_an Hash
    expect(result).to be_a Hash
    check_hash_structure(result[:attributes], :role, String)
  end

  xit 'can post a new character', :vcr do
    data  = { name: "larry",
              dnd_race: "elf",
              dnd_class: "rogue",
              user_id: "99"
            }
    query = BackendService.post_db_character(data)
  end
  # it 'can create a campaign on the db', :vcr do
  # end

  # it 'can create a user_campaign_dm', :vcr do
  # end

  # it 'can create a user_campaign_pl', :vcr do
  # end

  # it 'can create character on the db', :vcr do
  # end

  # it 'update a management form on the db', :vcr do
  # end

  # it 'post a db advance week', :vcr do
  # end

  # it 'can call the db', :vcr do
  # end
end
