require 'rails_helper'

RSpec.describe DndService do
  it 'can make API call to database' do
    query = DndService.call_db('classes')
    result = query[:results]
    
    expect(query).to be_an Hash
    expect(result).to be_a Array
    check_hash_structure(result.first, :name, String)
  end

  it 'can make API call to database' do
    query = DndService.call_db('races')
    result = query[:results]
    
    expect(query).to be_an Hash
    expect(result).to be_a Array
    check_hash_structure(result.first, :name, String)
  end
end