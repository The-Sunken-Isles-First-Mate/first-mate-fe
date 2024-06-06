require 'rails_helper'

RSpec.describe BackendService do
  it "can hit back end endpoint - items", :vcr do
    query = BackendService.call_db('api/v1/items/1')
    result = query[:data]

    expect(query).to be_an Hash
    expect(result).to be_a Hash
    check_hash_structure(result[:attributes], :name, String)
  end

  xit 'can make API call to database' do
    query = BackendService.call_db('/api/v1/users/1')
    result = query[:results]

    expect(query).to be_an Hash
    expect(result).to be_a Array
    check_hash_structure(result.first, :name, String)
  end

  it "can return a campaign and its attributes", :vcr do
    query = BackendService.call_db_for_campaign("/api/v1/campaigns/1")
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


  it "can return all characters from a campaign and their attributes", :vcr do
    query = BackendService.call_db_for_character("/api/v1/campaigns/1/characters")
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
end
