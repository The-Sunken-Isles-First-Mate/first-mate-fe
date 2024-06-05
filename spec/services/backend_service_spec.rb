require 'rails_helper'

RSpec.describe BackendService do
  it "can hit back end endpoint - items" do
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
end
