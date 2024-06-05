require 'rails_helper'

RSpec.describe DndFacade do
  it "get class info", :vcr do
    result = DndFacade.classes
    r = result.first

    expect(result).to be_an(Array)
    expect(r).to be_a(DndClass)
    expect(r.name).to be_an(String)
  end

  it "get race info", :vcr do
    result = DndFacade.races
    r = result.first

    expect(result).to be_an(Array)
    expect(r).to be_a(DndRace)
    expect(r.name).to be_an(String)
  end
end
