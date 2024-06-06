require 'rails_helper'

RSpec.describe DndFacade do
    it 'get class info', :vcr do
      result = DndFacade.get_attrs
      c = result.classes
      r = result.races
      
      expect(result).to be_an(CharsAttr)
      expect(r).to be_a(Array)
      expect(c).to be_a(Array)
      expect(r[0]).to be_an(String)
      expect(c[0]).to be_an(String)
    end
end
