require 'rails_helper'

RSpec.describe Character do
  it 'exists and has attributes' do
    character = Character.new({
      id: "12345",
      name: "Severus",
      user_id: 1,
      dnd_race: "Elf",
      dnd_class: "Druid",
      image_url: nil
    })

    expect(character).to be_a(Character)
    expect(character.id).to eq("12345")
    expect(character.name).to eq("Severus")
    expect(character.user_id).to eq(1) 
    expect(character.dnd_race).to eq("Elf") 
    expect(character.dnd_class).to eq("Druid") 
    expect(character.image_url).to eq(nil) 
  end
end