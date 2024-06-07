require 'rails_helper'

RSpec.describe CharsAttr do
  it 'exists and has attributes' do
    data = {
      "classes"=> [
        {:index=>"barbarian", :name=>"Barbarian", :url=>"/api/classes/barbarian"},
        {:index=>"bard", :name=>"Bard", :url=>"/api/classes/bard"}
      ],
      "races"=> [
        {:index=>"dragonborn", :name=>"Dragonborn", :url=>"/api/races/dragonborn"},
        {:index=>"dwarf", :name=>"Dwarf", :url=>"/api/races/dwarf"}
      ]
    }

    c = CharsAttr.new(data)
    
    expect(c).to be_an(CharsAttr)
    expect(c.races).to be_a(Array)
    expect(c.classes).to be_a(Array)
    expect(c.races[0]).to be_an(String)
    expect(c.classes[0]).to be_an(String)
  end
end