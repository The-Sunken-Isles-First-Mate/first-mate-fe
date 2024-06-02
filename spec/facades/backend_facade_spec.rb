require 'rails_helper'

RSpec.describe BackendFacade do
  # VCR.use_cassette('cassette_name.yml') do
    it 'can get item info' do
      result = BackendFacade.item(1)
      r      = result
      require 'pry'; binding.pry
      expect(result).to be_an(Array)
      expect(r).to be_a(DndClass)
      expect(r.name).to be_an(String)
    end
    # end
end